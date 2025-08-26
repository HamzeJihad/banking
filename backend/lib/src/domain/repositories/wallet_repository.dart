import 'package:backend/src/domain/dtos/request_extract_dto.dart';
import 'package:backend/src/domain/dtos/request_transfer_dto.dart';
import 'package:backend/src/domain/dtos/response_extract_dto.dart';
import 'package:backend/src/domain/entities/wallet_entity.dart';

abstract class WalletRepository {
  Future<WalletEntity> createWallet(int userId);
  Future<WalletEntity> getById(int id);
  Future<void> transfer(RequestTransferDto requestTransfer );
  Future<ResponseExtractDto> getExtracts(RequestExtractDto requestExtract);
}