

import 'wallet_dto.dart';
import 'package:decimal/decimal.dart';
import 'package:vaden_core/vaden_core.dart';




@DTO()
class RequestTransferDto {
  int toWalletId;
  @UseParse(DecimalParse)
  Decimal amount;

  RequestTransferDto({
    required this.toWalletId,
    required this.amount,
  });
}