
import 'package:backend/src/domain.dart';

abstract class UserRepository {
  Future<UserEntity> getUserById(int id);
  Future<UserEntity> create(CreateUserDto user);
  Future<UserEntity?> getUserByEmail(String email);
  Future<void> changePassword(int userId, ChangePasswordDto changePassword);

}
