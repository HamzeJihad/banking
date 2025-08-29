import '../../domain.dart';

class CreateUserUseCase implements UseCase<UserEntity, CreateUserDto> {
  final UserRepository userRepository;
  final WalletRepository walletRepository;

  CreateUserUseCase({required this.userRepository, required this.walletRepository});

  @override
  Future<UserEntity> call(CreateUserDto params) async {
    if (params.name.trim().isEmpty) {
      throw const ValidationFailure('Name cannot be empty');
    }

    if (params.email.trim().isEmpty) {
      throw const ValidationFailure('Email cannot be empty');
    }

    if (params.password.length < 6) {
      throw const ValidationFailure('Password must be at least 6 characters');
    }

    final existingUser = await userRepository.getUserByEmail(params.email);
    if (existingUser != null) {
      throw const ValidationFailure('User with this email already exists');
    }

    final user = await userRepository.create(params);

    await walletRepository.createWallet(user.id);

    return user;
  }
}
