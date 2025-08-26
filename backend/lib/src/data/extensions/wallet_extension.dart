import 'package:backend/config/drift/drift_configuration.dart';
import 'package:backend/src/domain.dart';
import 'package:decimal/decimal.dart';

extension WalletTableDataExtension on WalletTableData {
  WalletEntity toEntity(UserEntity user) {
    return WalletEntity(
      id: id.toString(),
      user: user,
      balance: Decimal.parse(balance),
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
