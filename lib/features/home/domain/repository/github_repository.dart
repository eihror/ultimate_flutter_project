import 'dart:async';

import 'package:ultimate_flutter_project/features/home/domain/model/github_repo.dart';

abstract class GithubRepository {
  FutureOr<List<GithubRepo>> fetchRepoListByUser({required String username});
}
