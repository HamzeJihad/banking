import '../../domain.dart';

class GetUserByIdParams {
  final int userId;

  GetUserByIdParams({required this.userId});
}

class GetUserByIdUseCase implements UseCase<UserEntity, GetUserByIdParams> {
  final UserRepository userRepository;

  GetUserByIdUseCase({required this.userRepository});

  @override
  Future<UserEntity> call(GetUserByIdParams params) async {
    if (params.userId <= 0) {
      throw const ValidationFailure('Invalid user ID');
    }

    try {
      final user = await userRepository.getUserById(params.userId);
      return user;
    } catch (e) {
      throw const NotFoundFailure('User not found');
    }
  }
}
