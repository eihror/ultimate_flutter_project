import 'dart:async';

import 'package:ultimate_flutter_project/features/github/domain/model/github_owner.dart';
import 'package:ultimate_flutter_project/features/github/domain/repository/github_repository.dart';

class FetchUserListUserCase {
  FetchUserListUserCase({
    required this.repository,
  });

  final GithubRepository repository;

  FutureOr<List<GithubOwner>> call({
    String? name,
  }) {
    return repository.fetchGithubUserList(username: name);
  }
}
