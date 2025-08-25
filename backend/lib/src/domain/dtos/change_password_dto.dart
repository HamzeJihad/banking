
class ChangePasswordDto {
  final String code;
  final String oldPassword;
  final String newPassword;

  ChangePasswordDto({
    required this.code,
    required this.oldPassword,
    required this.newPassword,
  });
}
