import 'package:backend/src/domain/entities/user_entity.dart';
import 'package:decimal/decimal.dart';

class WalletEntity {
  final String id;
  final UserEntity user;
  final Decimal balance;
  final DateTime createdAt;
  final DateTime updatedAt;

  WalletEntity({
    required this.id,
    required this.user,
    required this.balance,
    required this.createdAt,
    required this.updatedAt,
  });
}
