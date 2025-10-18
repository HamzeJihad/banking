
import 'package:flutter_vaden/flutter_vaden.dart';
import 'package:frontend/data/repositories/auth_repository.dart';
import 'package:result_command/result_command.dart';

@Component()
class HomeStore {
   final AuthRepository _authRepository;
   HomeStore(this._authRepository);


   late final logoutCommand = Command0(_authRepository.logout);
}
