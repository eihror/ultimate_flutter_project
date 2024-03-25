import 'dart:async';

import 'package:ultimate_flutter_project/features/home/domain/model/github_repo.dart';
import 'package:ultimate_flutter_project/features/home/domain/repository/github_repository.dart';

class FetchReposByUserUseCase {
  FetchReposByUserUseCase({
    required this.repository,
  });

  final GithubRepository repository;

  FutureOr<List<GithubRepo>> call({required String username}) {
    return repository.fetchRepoListByUser(username: username);
  }
}
