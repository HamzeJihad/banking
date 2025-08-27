
import 'package:domain/domain.dart';

@DTO()
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
