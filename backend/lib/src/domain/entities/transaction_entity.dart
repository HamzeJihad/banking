import 'package:backend/src/domain/entities/wallet_entity.dart';
import 'package:decimal/decimal.dart';

class TransactionEntity {
  final String id;
  final String userId;
  final WalletEntity toWallet;
  final WalletEntity fromWallet;
  final Decimal amount;
  final DateTime createdAt;

  TransactionEntity({
    required this.id,
    required this.userId,
    required this.toWallet,
    required this.fromWallet,
    required this.amount,
    required this.createdAt,
  });
}
