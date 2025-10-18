import 'package:domain/domain.dart';
import 'package:frontend/data/repositories/auth_repository.dart';
import 'package:result_command/result_command.dart';

@Component()
class AuthStore {
  final AuthRepository _authRepository;
  AuthStore(this._authRepository);

  late final loginCommand = Command1(_authRepository.login);
  late final checkAuthCommand = Command0(_authRepository.getLoggedUser);
  late final logoutCommand = Command0(_authRepository.logout);
}
