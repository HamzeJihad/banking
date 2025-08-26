

import 'package:backend/src/domain/dtos/wallet_dto.dart';
import 'package:decimal/decimal.dart';
import 'package:vaden/vaden.dart';




@DTO()
class RequestTransferDto {
  int fromWalletId;
  int toWalletId;
  @UseParse(DecimalParse)
  Decimal amount;

  RequestTransferDto({
    required this.fromWalletId,
    required this.toWalletId,
    required this.amount,
  });
}