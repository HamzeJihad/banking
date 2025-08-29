import '../../domain.dart';

class ChangePasswordParams {
  final int userId;
  final ChangePasswordDto changePasswordDto;

  ChangePasswordParams({required this.userId, required this.changePasswordDto});
}

class ChangePasswordUseCase implements UseCase<void, ChangePasswordParams> {
  final UserRepository userRepository;

  ChangePasswordUseCase({required this.userRepository});

  @override
  Future<void> call(ChangePasswordParams params) async {
    if (params.userId <= 0) {
      throw const ValidationFailure('Invalid user ID');
    }

    if (params.changePasswordDto.newPassword.length < 6) {
      throw const ValidationFailure('New password must be at least 6 characters');
    }

    if (params.changePasswordDto.newPassword == params.changePasswordDto.oldPassword) {
      throw const ValidationFailure('New password must be different from current password');
    }

    try {
      await userRepository.getUserById(params.userId);
    } catch (e) {
      throw const NotFoundFailure('User not found');
    }

    await userRepository.changePassword(params.userId, params.changePasswordDto);
  }
}
