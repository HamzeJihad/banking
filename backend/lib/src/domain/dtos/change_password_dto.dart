
class ChangePasswordDto {
  final int userId;
  final String oldPassword;
  final String newPassword;

  ChangePasswordDto({
    required this.userId,
    required this.oldPassword,
    required this.newPassword,
  });
}
