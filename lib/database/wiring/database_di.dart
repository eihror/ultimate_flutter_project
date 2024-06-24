import 'package:get_it/get_it.dart';
import 'package:ultimate_flutter_project/database/database.dart';
import 'package:ultimate_flutter_project/database/migration/database_migrations.dart';

abstract class DatabaseDI {
  static Future<void> injectDependencies() async {
    final AppDatabase database = await $FloorAppDatabase
        .databaseBuilder("ultimate_flutter_project.db")
        .addMigrations([
      migration1to2,
    ]).build();

    GetIt.I.registerSingleton<AppDatabase>(database);
  }
}
