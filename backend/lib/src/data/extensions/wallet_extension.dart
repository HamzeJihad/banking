import 'package:backend/config/drift/tables.dart';
import 'package:domain/domain.dart';

extension WalletTableDataExtension on WalletTableData {
  WalletEntity toEntity(UserEntity user) {
    return WalletEntity(
      id: id,
      user: user,
      balance: Decimal.parse(balance),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
