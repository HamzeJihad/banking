import 'package:backend/config/drift/tables.dart';

import 'package:backend/src/data/extensions/create_user_dto_extension.dart';
import 'package:backend/src/data/extensions/user_extesion.dart';
import 'package:backend/src/utils/response_error.dart';
import 'package:drift/drift.dart';
import 'package:vaden_security/vaden_security.dart';
import 'package:domain/domain.dart';

@Repository()
class UserRepositoryImpl implements UserRepository {
  final AppDatabase database;
  final PasswordEncoder passwordEncoder;
  final WalletRepository walletRepository;

  UserRepositoryImpl(this.database, this.passwordEncoder, this.walletRepository);

  @override
  Future<UserEntity> create(CreateUserDto user) async {
    return database.transaction(() async {
      final passwordHash = passwordEncoder.encode(user.password);
      final userCompanion = user.toCompanion(passwordHash);
      final newUser = await database.into(database.userTable).insertReturning(userCompanion);
      await walletRepository.createWallet(newUser.id);
      return newUser.toEntity();
    });
  }

  @override
  Future<UserEntity> getUserById(int id) async {
    final user = await database.managers.userTable.filter((e) => e.id.equals(id)).getSingleOrNull();
    return user!.toEntity();
  }
  
  @override
  Future<UserEntity?> getUserByEmail(String email) {
    return database.managers.userTable.filter((e) => e.email.equals(email)).getSingleOrNull().then((user) => user?.toEntity());
  }


  @override
  Future<void> changePassword(int userId, ChangePasswordDto changePassword) async {
    return database.transaction(() async {
      final user = await database.managers.userTable
          .filter((e) => e.id.equals(userId))
          .getSingleOrNull();

      if (user == null) {
        throw ResponseError.notFound('User not found');
      }

      final isValid = passwordEncoder.matches(changePassword.oldPassword, user.password);
      if (!isValid) {
        throw ResponseError.unauthorized('Invalid old password');
      }

      final newPasswordHash = passwordEncoder.encode(changePassword.newPassword);

      await database.managers.userTable.filter((e) => e.id.equals(userId)).update((e) {
        return e(password: Value(newPasswordHash), updatedAt: Value(DateTime.now()));
      });
    });
  }

}
