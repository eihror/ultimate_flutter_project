import 'package:floor/floor.dart';
import 'package:ultimate_flutter_project/database/entity/github_repo_entity.dart';

@dao
abstract class RepoDao {
  @Query("""
    SELECT *
    FROM repo
    WHERE repo.owner_login = :username
  """)
  Future<List<GithubRepoEntity>> fetchAllByUser(String username);
}
