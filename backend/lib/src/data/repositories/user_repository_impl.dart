import 'package:backend/config/drift/drift_configuration.dart';
import 'package:backend/src/data/extensions/create_user_dto_extension.dart';
import 'package:backend/src/data/extensions/user_extesion.dart';
import 'package:backend/src/domain.dart';
import 'package:vaden/vaden.dart';
import 'package:vaden_security/vaden_security.dart';

@Repository()
class UserRepositoryImpl implements UserRepository {
  final AppDatabase database;
  final PasswordEncoder passwordEncoder;
  final WalletRepository walletRepository;

  UserRepositoryImpl(this.database, this.passwordEncoder, this.walletRepository);

  @override
  Future<UserEntity> create(CreateUserDto user) async {
    return database.transaction(() async {
      final passwordHash = passwordEncoder.encode(user.password);
      final userCompanion = user.toCompanion(passwordHash);
      final newUser = await database.into(database.userTable).insertReturning(userCompanion);
      await walletRepository.createWallet(newUser.id);
      return newUser.toEntity();
    });
  }

  @override
  Future<UserEntity> getUserById(int id) async {
    final user = await database.managers.userTable.filter((e) => e.id.equals(id)).getSingleOrNull();
    return user!.toEntity();
  }
}
