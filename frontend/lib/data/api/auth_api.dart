import 'package:domain/domain.dart';
import 'package:frontend/domain/dto/tokenization.dart';

@ApiClient('/auth')
abstract class AuthApi {

  @Post('/login')
  Future<Tokenization> login(@Header('Authorization') String authorization);

  @Post('/refresh')
  Future<Tokenization> refresh(@Header('Authorization') String authorization);
}

