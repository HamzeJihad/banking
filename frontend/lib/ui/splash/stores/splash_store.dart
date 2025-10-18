
import 'package:domain/domain.dart';
import 'package:frontend/data/repositories/auth_repository.dart';
import 'package:result_command/result_command.dart';

@Component()
class SplashStore {
   final AuthRepository _authRepository;
   SplashStore(this._authRepository);

   late final getLoggedUser = Command0(_authRepository.getLoggedUser);
}
