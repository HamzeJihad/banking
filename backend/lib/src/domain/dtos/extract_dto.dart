import 'package:decimal/decimal.dart';

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

class ReceivedExtractDto implements ExtractDto {
  final DateTime transactionDate;
  final Decimal amount;
  final String from;

  const ReceivedExtractDto({required this.from, required this.transactionDate, required this.amount});
}

class SentExtractDto implements ExtractDto {
  final DateTime transactionDate;
  final Decimal amount;
  final String to;

  const SentExtractDto({required this.to, required this.transactionDate, required this.amount});
}
