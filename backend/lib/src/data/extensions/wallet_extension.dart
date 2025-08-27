import 'package:backend/config/drift/drift_configuration.dart';
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
