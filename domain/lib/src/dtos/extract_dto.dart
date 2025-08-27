import 'wallet_dto.dart';
import 'package:decimal/decimal.dart';
import 'package:vaden_core/vaden_core.dart';

export '../parses/decimal_parse.dart';


@DTO()
sealed class  ExtractDto {
  const factory ExtractDto.received({
    required DateTime transactionDate,
    required Decimal amount,
    required String from,
  }) = ReceivedExtractDto;

  const factory ExtractDto.sent({
    required DateTime transactionDate,
    required Decimal amount,
    required String to,
  }) = SentExtractDto;
}

@DTO()
class ReceivedExtractDto implements ExtractDto {
  final DateTime transactionDate;
  @UseParse(DecimalParse)
  final Decimal amount;
  final String from;

  const ReceivedExtractDto({required this.from, required this.transactionDate, required this.amount});
}

@DTO()
class SentExtractDto implements ExtractDto {
  final DateTime transactionDate;
  @UseParse(DecimalParse)
  final Decimal amount;
  final String to;

  const SentExtractDto({required this.to, required this.transactionDate, required this.amount});
}
