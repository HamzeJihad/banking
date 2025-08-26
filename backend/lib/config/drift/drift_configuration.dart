import 'package:drift/drift.dart';
import 'package:vaden/vaden.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:postgres/postgres.dart' as pg;

part 'drift_configuration.g.dart';

class UserTable extends Table {
  late final id = integer().autoIncrement()();
  late final name = text()();
  late final email = text()();
  late final password = text()();
  late final role = text()();
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
  late final updatedAt = dateTime().withDefault(currentDateAndTime)();
}

class WalletTable extends Table {
  late final id = integer().autoIncrement()();
  late final userId = integer().references(UserTable, #id)();
  late final balance = text()();
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
  late final updatedAt = dateTime().withDefault(currentDateAndTime)();
}

class TransactionTable extends Table {
  late final id = integer().autoIncrement()();
  late final userId = integer().references(UserTable, #id)();
  late final toWalletId = integer().references(WalletTable, #id)();
  late final fromWalletId = integer().references(WalletTable, #id)();
  late final amount = text()();
  late final createdAt = dateTime().withDefault(currentDateAndTime)();
}

@DriftDatabase(tables: [UserTable, WalletTable, TransactionTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  @Bean()
  AppDatabase createAppDatabase(QueryExecutor executor) {
    return AppDatabase(executor);
  }
}

@Configuration()
class DriftConfiguration {
  @Bean()
  QueryExecutor createQueryExecutor(ApplicationSettings settings) {
    return PgDatabase(
      endpoint: pg.Endpoint(
        host: settings['database']['host'],
        database: settings['database']['name'],
        username: settings['database']['username'],
        password: settings['database']['password']  ,
      ),
    );
  }
}
