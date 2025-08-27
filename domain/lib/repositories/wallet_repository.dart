import '../dtos/request_extract_dto.dart';
import '../dtos/request_transfer_dto.dart';
import '../dtos/response_extract_dto.dart';
import '../entities/wallet_entity.dart';

abstract class WalletRepository {
  Future<WalletEntity> createWallet(int userId);
  Future<WalletEntity> getById(int id);
  Future<void> transfer(int fromWalletId, RequestTransferDto requestTransfer );
  Future<ResponseExtractDto> getExtracts(RequestExtractDto requestExtract);
}