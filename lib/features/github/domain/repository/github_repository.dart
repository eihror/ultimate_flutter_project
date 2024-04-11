import 'dart:async';

import 'package:ultimate_flutter_project/features/github/domain/model/github_owner.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_repo.dart';

abstract class GithubRepository {
  FutureOr<List<GithubOwner>> fetchGithubUserList({required String? username});

  FutureOr<List<GithubRepo>> fetchRepoListByUser({required String username});
}
