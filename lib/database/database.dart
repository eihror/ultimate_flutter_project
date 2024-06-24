import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:ultimate_flutter_project/database/dao/owner_dao.dart';
import 'package:ultimate_flutter_project/database/dao/repo_dao.dart';
import 'package:ultimate_flutter_project/database/entity/github_owner_entity.dart';
import 'package:ultimate_flutter_project/database/entity/github_repo_entity.dart';

part 'database.g.dart';

@Database(
  version: 2,
  entities: [
    GithubOwnerEntity,
    GithubRepoEntity,
  ],
)
abstract class AppDatabase extends FloorDatabase {
  OwnerDao get ownerDao;

  RepoDao get repoDao;
}
