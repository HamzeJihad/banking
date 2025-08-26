

import 'package:vaden/vaden.dart';

@DTO()
class ChangePasswordDto {
  final String oldPassword;
  final String newPassword;

  ChangePasswordDto({
    required this.oldPassword,
    required this.newPassword,
  });
}
