

import 'package:backend/config/security/user_details_service.dart';
import 'package:backend/src/domain.dart';
import 'package:backend/src/domain/dtos/wallet_dto.dart';
import 'package:backend/src/utils/response_message.dart';
import 'package:vaden/vaden.dart';


@Api(tag: 'wallet')
@Controller('/wallet')
class WalletController {

  final WalletRepository walletRepository;

  WalletController(this.walletRepository);


  @ApiOperation(summary: 'Get wallet by user ID')
  @ApiResponse(200, content: ApiContent(type: 'json/application', schema: WalletDto))
  @Get('/byUser')
  Future<WalletDto> getWalletsByUserId(@Context() User user) async {
    final wallets = await walletRepository.getById(user.id);
    return WalletDto.fromEntity(wallets);
  }


  @ApiOperation(summary: 'Transfer funds between wallets')
  @ApiResponse(200, content: ApiContent(type: 'json/application', schema: ResponseMessage))
  @Post('/transfer')
  Future<ResponseMessage> transferFunds(@Body() RequestTransferDto requestTransfer) async {
    await walletRepository.transfer(requestTransfer);
    return ResponseMessage('Transfer successful');
  }

  @ApiOperation(summary: 'Get wallet extracts with pagination')
  @ApiResponse(200, content: ApiContent(type: 'json/application', schema: ResponseExtractDto))
  @Get('/extracts/<page>/<walletId>')
  Future<ResponseExtractDto> getExtracts(@Param() int page, @Param() int walletId) async {
    final request = RequestExtractDto(walletId: walletId, page: page);
    final extracts = await walletRepository.getExtracts(request);
    return extracts;
  }
}