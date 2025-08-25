import 'package:backend/src/domain/entities/wallet_entity.dart';

enum UserRole { admin, user, guest }

class UserEntity {
  final String id;
  final String name;
  final String email;

  final String password;

  final UserRole role;
  final WalletEntity wallet;
  final DateTime createdAt;
  final DateTime updatedAt;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.wallet,
    required this.password,
  });
}
