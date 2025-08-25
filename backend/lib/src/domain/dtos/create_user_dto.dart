import 'package:backend/src/domain/entities/user_entity.dart';

class CreateUserDto {
  final String name;
  final String email;
  final UserRole role;
  final String password;


  CreateUserDto({
    required this.name,
    required this.email,
    required this.role,
    required this.password,

  });
}
