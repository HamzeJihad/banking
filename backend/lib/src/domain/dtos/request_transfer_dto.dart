

import 'package:decimal/decimal.dart';

class RequestTransferDto {
  int fromWalletId;
  int toWalletId;
  Decimal amount;

  RequestTransferDto({
    required this.fromWalletId,
    required this.toWalletId,
    required this.amount,
  });
}