import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:postgres/postgres.dart' as pg;
import 'package:postgres/postgres.dart';
import 'package:vaden/vaden.dart';

part 'drift_configuration.g.dart';

class UserTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get email => text().unique()();
  TextColumn get password => text()();
  TextColumn get role => text()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt => dateTime().clientDefault(() => DateTime.now())();
}

class WalletTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(UserTable, #id)();
  TextColumn get balance => text()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
  DateTimeColumn get updatedAt => dateTime().clientDefault(() => DateTime.now())();
}

class TransactionTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer().references(UserTable, #id)();
  IntColumn get toWalletId => integer().references(WalletTable, #id)();
  IntColumn get fromWalletId => integer().references(WalletTable, #id)();
  TextColumn get amount => text()();
  DateTimeColumn get createdAt => dateTime().clientDefault(() => DateTime.now())();
}

@DriftDatabase(tables: [UserTable, WalletTable, TransactionTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}

@Configuration()
class DriftConfiguration {
  @Bean()
  Future<QueryExecutor> nativeDatabase(ApplicationSettings settings) async {
    final database = settings['database'];
    final endpoint = pg.Endpoint(
      host: database['host'],
      port: database['port'],
      database: database['name'],
      username: database['username'],
      password: database['password'],
    );
    
    return PgDatabase(
      endpoint: endpoint,
      settings: const ConnectionSettings(
        sslMode: pg.SslMode.disable,
      ),
    );
  }

  @Bean()
  AppDatabase createAppDatabase(QueryExecutor executor) {
    return AppDatabase(executor);
  }
}
