import 'package:backend/config/security/user_details_service.dart';
import 'package:domain/domain.dart';

@Api(tag: 'wallet')
@Controller('/wallet')
class WalletController {
  final GetWalletByUserIdUseCase _getWalletByUserIdUseCase;
  final TransferFundsUseCase _transferFundsUseCase;
  final GetWalletExtractsUseCase _getWalletExtractsUseCase;

  WalletController(WalletRepository walletRepository, UserRepository userRepository)
    : _getWalletByUserIdUseCase = GetWalletByUserIdUseCase(
        walletRepository: walletRepository,
        userRepository: userRepository,
      ),
      _transferFundsUseCase = TransferFundsUseCase(
        walletRepository: walletRepository,
        userRepository: userRepository,
      ),
      _getWalletExtractsUseCase = GetWalletExtractsUseCase(walletRepository: walletRepository);

  @ApiOperation(summary: 'Get wallet by user ID')
  @ApiResponse(
    200,
    content: ApiContent(type: 'json/application', schema: WalletDto),
  )
  @Get('/byUser')
  Future<WalletDto> getWalletsByUserId(@Context() User user) async {
    final params = GetWalletByUserIdParams(userId: user.id);
    final wallet = await _getWalletByUserIdUseCase.call(params);
    return WalletDto.fromEntity(wallet);
  }

  @ApiOperation(summary: 'Transfer funds between wallets')
  @ApiResponse(
    200,
    content: ApiContent(type: 'json/application', schema: ResponseMessage),
  )
  @Post('/transfer')
  Future<ResponseMessage> transferFunds(
    @Body() RequestTransferDto requestTransfer,
    @Context() User user,
  ) async {
    final params = TransferFundsParams(fromUserId: user.id, transferRequest: requestTransfer);
    await _transferFundsUseCase.call(params);
    return ResponseMessage('Transfer successful');
  }

  @ApiOperation(summary: 'Get wallet extracts with pagination')
  @ApiResponse(
    200,
    content: ApiContent(type: 'json/application', schema: ResponseExtractDto),
  )
  @Get('/extracts/<page>/<walletId>')
  Future<ResponseExtractDto> getExtracts(@Param() int page, @Param() int walletId) async {
    final params = GetWalletExtractsParams(page: page, walletId: walletId);
    final extracts = await _getWalletExtractsUseCase.call(params);
    return extracts;
  }
}
