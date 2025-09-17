import 'package:domain/domain.dart';

@ApiClient('/wallet')
abstract class WalletApi {
  @Get('/byUser')
  Future<WalletDto> getWalletsByUserId();

  @Post('/transfer')
  Future<ResponseMessage> transferFunds(@Body() RequestTransferDto requestTransfer);

  @Get('/extracts/<page>/<walletId>')
  Future<ResponseExtractDto> getExtracts(@Param() int page, @Param() int walletId);
}
