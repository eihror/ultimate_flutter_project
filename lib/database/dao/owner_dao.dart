import 'dart:async';

import 'package:floor/floor.dart';
import 'package:ultimate_flutter_project/database/entity/github_owner_entity.dart';

@dao
abstract class OwnerDao {
  @Query("""
    SELECT *
    FROM owner
  """)
  Future<List<GithubOwnerEntity>> fetchAll();
}
