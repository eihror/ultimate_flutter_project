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

  @Query("""
    SELECT *
    from owner
    WHERE owner.name = :name
  """)
  Future<GithubOwnerEntity?> fetchOwnerByName(String name);

  @Query("""
    SELECT *
    from owner
    WHERE owner.name LIKE '%' || :name || '%'
  """)
  Future<List<GithubOwnerEntity>> fetchOwnerListByName(String name);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertOwner(GithubOwnerEntity owner);

  @delete
  Future<void> deleteOwner(GithubOwnerEntity owner);
}
