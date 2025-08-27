import 'package:domain/domain.dart';

export '../parses/decimal_parse.dart';

@DTO()
class WalletDto {
  final int id;
  @UseParse(DecimalParse)
  final Decimal balance;
  final int userId;

  WalletDto({
    required this.id,
    required this.balance,
    required this.userId,
  });

  factory WalletDto.fromEntity(WalletEntity entity) {
    return WalletDto(
      id: entity.id,
      balance: entity.balance,
      userId: entity.id,
    );
  }
}
