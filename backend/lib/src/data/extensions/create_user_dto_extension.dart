import 'package:backend/config/drift/drift_configuration.dart';
import 'package:backend/src/domain.dart';
import 'package:drift/drift.dart';

extension CreateUserDtoExtension on CreateUserDto {
  UserTableCompanion toCompanion(String passwordHash) {
    return UserTableCompanion(
      name: Value(name),
      email: Value(email),
      password: Value(passwordHash),
      role: Value(role.name),
    );
  }
}
