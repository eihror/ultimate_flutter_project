import 'dart:async';

import 'package:ultimate_flutter_project/features/github/domain/model/github_repo.dart';
import 'package:ultimate_flutter_project/features/github/domain/repository/github_repository.dart';

class FetchReposByUserUseCase {
  FetchReposByUserUseCase({
    required this.repository,
  });

  final GithubRepository repository;

  FutureOr<List<GithubRepo>> call({required String username}) async {
    return await repository.fetchRepoListByUser(username: username);
  }
}
