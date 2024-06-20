import 'package:get_it/get_it.dart';
import 'package:ultimate_flutter_project/database/database.dart';

abstract class DatabaseDI {
  static Future<void> injectDependencies() async {
    final AppDatabase database = await $FloorAppDatabase
        .databaseBuilder("ultimate_flutter_project.db")
        .build();

    GetIt.I.registerSingleton<AppDatabase>(database);
  }
}
