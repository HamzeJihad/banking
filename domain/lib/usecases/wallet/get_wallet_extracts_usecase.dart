import '../../domain.dart';

class GetWalletExtractsParams {
  final int page;
  final int walletId;

  GetWalletExtractsParams({required this.page, required this.walletId});
}

class GetWalletExtractsUseCase implements UseCase<ResponseExtractDto, GetWalletExtractsParams> {
  final WalletRepository walletRepository;

  GetWalletExtractsUseCase({required this.walletRepository});

  @override
  Future<ResponseExtractDto> call(GetWalletExtractsParams params) async {
    if (params.page <= 0) {
      throw const ValidationFailure('Page number must be greater than zero');
    }

    if (params.walletId <= 0) {
      throw const ValidationFailure('Invalid wallet ID');
    }

    try {
      await walletRepository.getById(params.walletId);
    } catch (e) {
      throw const NotFoundFailure('Wallet not found');
    }

    final request = RequestExtractDto(walletId: params.walletId, page: params.page);

    final extracts = await walletRepository.getExtracts(request);
    return extracts;
  }
}
