import 'dart:async';

import 'package:ultimate_flutter_project/features/github/domain/model/github_owner.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_repo.dart';

abstract class LocalGithubDataSource {
  FutureOr<GithubOwner?> findGithubUserByName({required String username});

  FutureOr<List<GithubOwner>> fetchGithubUserList({required String? username});

  FutureOr<List<GithubRepo>> fetchRepoListByUser({required String username});

  FutureOr<void> favoriteGithubUser({required GithubOwner value});

  FutureOr<void> unFavoriteGithubUser({required GithubOwner value});

  FutureOr<void> favoriteGithubRepo({required GithubRepo value});
}
