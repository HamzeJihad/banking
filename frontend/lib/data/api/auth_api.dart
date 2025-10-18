import 'package:domain/domain.dart';
import 'package:frontend/domain/dto/tokenization.dart';

@ApiClient('/auth')
abstract class AuthApi {

  @Get('/login')
  Future<Tokenization> login(@Header('Authorization') String authorization);

  @Get('/refresh')
  Future<Tokenization> refresh(@Header('Authorization') String authorization);
}

