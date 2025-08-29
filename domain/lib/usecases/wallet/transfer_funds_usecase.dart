import '../../domain.dart';

class TransferFundsParams {
  final int fromUserId;
  final RequestTransferDto transferRequest;

  TransferFundsParams({required this.fromUserId, required this.transferRequest});
}

class TransferFundsUseCase implements UseCase<void, TransferFundsParams> {
  final WalletRepository walletRepository;
  final UserRepository userRepository;

  TransferFundsUseCase({required this.walletRepository, required this.userRepository});

  @override
  Future<void> call(TransferFundsParams params) async {
    if (params.fromUserId <= 0) {
      throw const ValidationFailure('Invalid user ID');
    }

    if (params.transferRequest.toWalletId <= 0) {
      throw const ValidationFailure('Invalid recipient wallet ID');
    }

    if (params.transferRequest.amount <= Decimal.zero) {
      throw const ValidationFailure('Transfer amount must be greater than zero');
    }

    try {
      await userRepository.getUserById(params.fromUserId);
    } catch (e) {
      throw const NotFoundFailure('Sender user not found');
    }

    final fromWallet = await walletRepository.getById(params.fromUserId);

    try {
      await walletRepository.getById(params.transferRequest.toWalletId);
    } catch (e) {
      throw const NotFoundFailure('Recipient wallet not found');
    }

    if (fromWallet.id == params.transferRequest.toWalletId) {
      throw const ValidationFailure('Cannot transfer to the same wallet');
    }

    if (fromWallet.balance < params.transferRequest.amount) {
      throw const InsufficientFundsFailure('Insufficient funds for transfer');
    }

    await walletRepository.transfer(fromWallet.id, params.transferRequest);
  }
}
