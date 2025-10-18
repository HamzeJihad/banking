import 'package:backend/config/drift/tables.dart';


import 'package:backend/src/data/extensions/user_extesion.dart';
import 'package:backend/src/data/extensions/wallet_extension.dart';
import 'package:domain/domain.dart';
import 'package:backend/src/utils/response_error.dart';
import 'package:drift/drift.dart';

@Repository()
class WalletRepositoryImpl implements WalletRepository {
  final AppDatabase database;

  WalletRepositoryImpl(this.database);

  @override
  Future<WalletEntity> createWallet(int userId) async {
    final walletCompanion = WalletTableCompanion.insert(userId: userId, balance: '0.0');
    final walletData = await database.into(database.walletTable).insertReturning(walletCompanion);
    final userData = await database.managers.userTable.filter((e) => e.id.equals(userId)).getSingle();

    return walletData.toEntity(userData.toEntity());
  }


  @override
  Future<WalletEntity> getById(int id) async {
    final walletData = await database.managers.walletTable.filter((e) => e.id.equals(id)).getSingleOrNull();
    if (walletData == null) {
      throw ResponseError.notFound('Wallet not found');
    }
    final userData = await database.managers.userTable
        .filter((e) => e.id.equals(walletData.userId))
        .getSingle();
    return walletData.toEntity(userData.toEntity());
  }

  @override
  Future<ResponseExtractDto> getExtracts(RequestExtractDto requestExtract) async {
    final pageSize = 10;
    final offset = (requestExtract.page - 1) * pageSize;

    final fromWallet = database.alias(database.walletTable, 'from_wallet');
    final toWallet = database.alias(database.walletTable, 'to_wallet');
    final fromUser = database.alias(database.userTable, 'from_user');
    final toUser = database.alias(database.userTable, 'to_user');

    final query = database.select(database.transactionTable).join([
      innerJoin(fromWallet, fromWallet.id.equalsExp(database.transactionTable.fromWalletId)),
      innerJoin(fromUser, fromUser.id.equalsExp(fromWallet.userId)),
      innerJoin(toWallet, toWallet.id.equalsExp(database.transactionTable.toWalletId)),
      innerJoin(toUser, toUser.id.equalsExp(toWallet.userId)),
    ]);

    query.where(
      database.transactionTable.fromWalletId.equals(requestExtract.walletId) |
          database.transactionTable.toWalletId.equals(requestExtract.walletId),
    );
    query.orderBy([OrderingTerm.desc(database.transactionTable.createdAt)]);
    query.limit(pageSize, offset: offset);

    final results = await query.get();

    final extracts = results.map((row) {
      final transaction = row.readTable(database.transactionTable);
      final fromUserData = row.readTable(fromUser);
      final toUserData = row.readTable(toUser);

      if (transaction.fromWalletId == requestExtract.walletId) {
        // Sent
        return ExtractDto.sent(
          transactionDate: transaction.createdAt,
          amount: Decimal.parse(transaction.amount),
          to: toUserData.name,
        );
      } else {
        // Received
        return ExtractDto.received(
          transactionDate: transaction.createdAt,
          amount: Decimal.parse(transaction.amount),
          from: fromUserData.name,
        );
      }
    }).toList();

    int? nextPage;
    if (extracts.length == pageSize) {
      nextPage = requestExtract.page + 1;
    }
    final response = ResponseExtractDto(
      extracts: extracts,
      currentPage: requestExtract.page,
      nextPage: nextPage,
    );

    return response;
  }

  @override
  Future<void> transfer(int fromWalletId, RequestTransferDto requestTransfer) {
    return database.transaction(() async {
      final fromWallet = await (database.select(
        database.walletTable,
      )..where((tbl) => tbl.id.equals(fromWalletId))).getSingle();
      final toWallet = await (database.select(
        database.walletTable,
      )..where((tbl) => tbl.id.equals(requestTransfer.toWalletId))).getSingle();

      final fromBalance = Decimal.parse(fromWallet.balance);

      if (fromBalance < requestTransfer.amount) {
        throw ResponseError.badRequest('Insufficient balance');
      }

      final newFromBalance = fromBalance - requestTransfer.amount;
      final newToBalance = Decimal.parse(toWallet.balance) + requestTransfer.amount;

      await (database.update(
        database.walletTable,
      )..where((tbl) => tbl.id.equals(fromWalletId))).write(
        WalletTableCompanion(
          balance: Value(newFromBalance.toStringAsFixed(2)),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await (database.update(
        database.walletTable,
      )..where((tbl) => tbl.id.equals(requestTransfer.toWalletId))).write(
        WalletTableCompanion(
          balance: Value(newToBalance.toStringAsFixed(2)),
          updatedAt: Value(DateTime.now()),
        ),
      );

      await database
          .into(database.transactionTable)
          .insert(
            TransactionTableCompanion.insert(
              userId: fromWallet.userId,
              fromWalletId: fromWalletId,
              toWalletId: requestTransfer.toWalletId,
              amount: requestTransfer.amount.toString(),
            ),
          );
    });
  }
}
