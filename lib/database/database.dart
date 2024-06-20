import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:ultimate_flutter_project/database/dao/owner_dao.dart';
import 'package:ultimate_flutter_project/database/entity/github_owner_entity.dart';

part 'database.g.dart';

@Database(
  version: 1,
  entities: [
    GithubOwnerEntity,
  ],
)
abstract class AppDatabase extends FloorDatabase {
  OwnerDao get ownerDao;
}
