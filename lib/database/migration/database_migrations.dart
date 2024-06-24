import 'package:floor/floor.dart';

final migration1to2 = Migration(1, 2, (database) async {
  await database.execute("""
        ALTER TABLE owner 
        DROP COLUMN is_favorite
      """);

  await database.execute("""
        ALTER TABLE repo 
        DROP COLUMN is_favorite
      """);
});
