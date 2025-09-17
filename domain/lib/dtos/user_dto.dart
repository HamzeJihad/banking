import '../domain.dart';

@DTO()
sealed class UserDto {
  factory UserDto.withlessPassword({
    required int id,
    required String email,
    required String name,
    required UserRole role,
  }) = UserDtoWithlessPassword;

  factory UserDto.withPassword({
    required int id,
    required String email,
    required String name,
    required String password,
    required UserRole role,
  }) = UserDtoWithPassword;

  static Future<UserDto> fromEntity(UserEntity user) async {
    return UserDto.withlessPassword(id: user.id, email: user.email, name: user.name, role: user.role);
  }
}

@DTO()
class UserDtoWithPassword implements UserDto {
  int id;
  String email;
  String name;
  String password;
  UserRole role;

  UserDtoWithPassword({
    required this.id,
    required this.email,
    required this.name,
    required this.password,
    required this.role,
  });
}

@DTO()
class UserDtoWithlessPassword implements UserDto {
  int id;
  String email;
  String name;
  UserRole role;

  UserDtoWithlessPassword({required this.id, required this.email, required this.name, required this.role});
}
