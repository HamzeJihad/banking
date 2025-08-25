enum UserRole { admin, user, guest }

class UserEntity {
  final int id;
  final String name;
  final String email;
  final String password;
  final UserRole role;
  final DateTime createdAt;
  final DateTime updatedAt;
  
  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.password,
  });
}
