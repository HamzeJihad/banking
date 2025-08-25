
import 'package:backend/config/drift/drift_configuration.dart';
import 'package:backend/src/data/extensions/user_extesion.dart';
import 'package:backend/src/domain.dart';
import 'package:drift/drift.dart';
import 'package:vaden/vaden.dart';
import 'package:vaden_security/vaden_security.dart';

@Repository()
class AuthRepositoryImpl implements AuthRepository {
  final AppDatabase database;
  final PasswordEncoder passwordEncoder;

  AuthRepositoryImpl(this.database, this.passwordEncoder);

  @override
  Future<void> changePassword(ChangePasswordDto changePassword) async {
    return database.transaction(() async {
      final user = await database.managers.userTable
          .filter((e) => e.id.equals(changePassword.userId))
          .getSingleOrNull();

      if (user == null) {
        throw Exception('User not found');
      }

      final isValid = passwordEncoder.matches(changePassword.oldPassword, user.password);
      if (!isValid) {
        throw Exception('Invalid old password');
      }

      final newPasswordHash = passwordEncoder.encode(changePassword.newPassword);

      await database.managers.userTable.filter((e) => e.id.equals(changePassword.userId)).update((e) {
        return e(password: Value(newPasswordHash), updatedAt: Value(DateTime.now()));
      });
    });
  }

  @override
  Future<UserEntity?> login(CredentialsDto credentials) async {
    final user = await database.managers.userTable
        .filter((e) => e.email.equals(credentials.email))
        .getSingleOrNull();

    if (user == null) {
      throw Exception('User not found');
    }

    final isValid = passwordEncoder.matches(credentials.password, user.password);
    if (!isValid) {
      throw Exception('Invalid password');
    }

    return user.toEntity();
  }
}
