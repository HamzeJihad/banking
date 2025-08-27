import 'package:domain/domain.dart';
import 'package:vaden_security/vaden_security.dart';

@Service()
class UserDetailsServiceImpl implements UserDetailsService {

  final UserRepository _userRepository;

  UserDetailsServiceImpl(this._userRepository);

  @override
  Future<UserDetails?> loadUserByUsername(String email) async {
    final user = await _userRepository.getUserByEmail(email);
    if (user != null) {
      return User(
        id: user.id,
        username: user.email,
        password: user.password,
        roles: [user.role.name],
      );
    }
    return null;
  }
}


class User extends UserDetails {
  final int id;

  String get email => username;

  User({
    required this.id,
    required super.password,
    required super.username,
    required super.roles,
  });
}