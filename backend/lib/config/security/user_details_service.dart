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
      return User(id: user.id, email: user.email, password: user.password, role: user.role, name: user.name);
    }
    return null;
  }
}

@DTO()
class User extends UserDetails {
  final int id;

  final String email;
  final UserRole role;
  final String name;

  User({required this.id, required super.password, required this.email, required this.role, required this.name})
    : super(username: email, roles: [role.name]);
}
