import 'package:backend/config/drift/tables.dart';
import 'package:drift/drift.dart';
import 'package:drift_postgres/drift_postgres.dart';
import 'package:postgres/postgres.dart' as pg;
import 'package:postgres/postgres.dart';
import 'package:vaden/vaden.dart';



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
