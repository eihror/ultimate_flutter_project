import 'dart:async';

import 'package:ultimate_flutter_project/features/github/domain/model/github_owner.dart';
import 'package:ultimate_flutter_project/features/github/domain/repository/github_repository.dart';

class FavoriteOwnerUseCase {
  FavoriteOwnerUseCase({
    required this.repository,
  });

  final GithubRepository repository;

  FutureOr<void> call({
    required GithubOwner owner,
  }) async {
    final validateIfOwnerAlreadyExists =
        await repository.findOwnerOnDatabase(name: owner.name);

    if (validateIfOwnerAlreadyExists == null) {
      repository.favoriteGithubUser(value: owner);
    } else {
      repository.unFavoriteGithubUser(value: owner);
    }
  }
}
