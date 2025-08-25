
import 'package:backend/src/domain/dtos/create_user_dto.dart';
import 'package:backend/src/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity?> getUserById(int id);
  Future<void> create(CreateUserDto user);
}
