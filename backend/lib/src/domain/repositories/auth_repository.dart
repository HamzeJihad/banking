import 'package:backend/src/domain/dtos/change_password_dto.dart';
import 'package:backend/src/domain/dtos/credentials_dto.dart';
import 'package:backend/src/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> login(CredentialsDto credentials);
  Future<void> changePassword(ChangePasswordDto changePassword);
}
