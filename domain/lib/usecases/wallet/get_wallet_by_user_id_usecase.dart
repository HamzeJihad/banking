import '../../domain.dart';

class GetWalletByUserIdParams {
  final int userId;

  GetWalletByUserIdParams({required this.userId});
}

class GetWalletByUserIdUseCase implements UseCase<WalletEntity, GetWalletByUserIdParams> {
  final WalletRepository walletRepository;
  final UserRepository userRepository;

  GetWalletByUserIdUseCase({required this.walletRepository, required this.userRepository});

  @override
  Future<WalletEntity> call(GetWalletByUserIdParams params) async {
    if (params.userId <= 0) {
      throw const ValidationFailure('Invalid user ID');
    }

    try {
      await userRepository.getUserById(params.userId);
    } catch (e) {
      throw const NotFoundFailure('User not found');
    }

    try {
      final wallet = await walletRepository.getById(params.userId);
      return wallet;
    } catch (e) {
      throw const NotFoundFailure('Wallet not found for this user');
    }
  }
}
