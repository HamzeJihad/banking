import 'package:domain/domain.dart';


@DTO()
class UserDto {
  final int id;
  final String email;
  final String name;
  final UserRole role;

  UserDto({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
  });

  factory UserDto.fromEntity(UserEntity entity) {
    return UserDto(
      id: entity.id,
      email: entity.email,
      name: entity.name,
      role: entity.role,
    );
  }
}