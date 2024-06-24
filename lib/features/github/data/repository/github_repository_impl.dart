import 'dart:async';

import 'package:ultimate_flutter_project/features/github/data/data_source/local/local_github_data_source.dart';
import 'package:ultimate_flutter_project/features/github/data/data_source/remote/remote_github_data_source.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_owner.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_repo.dart';
import 'package:ultimate_flutter_project/features/github/domain/repository/github_repository.dart';

class GithubRepositoryImpl extends GithubRepository {
  GithubRepositoryImpl({
    required this.localGithubDataSource,
    required this.remoteGithubDataSource,
  });

  final LocalGithubDataSource localGithubDataSource;
  final RemoteGithubDataSource remoteGithubDataSource;

  @override
  FutureOr<List<GithubRepo>> fetchRepoListByUser({
    required String username,
  }) async {
    List<GithubRepo> result = <GithubRepo>[];

    try {
      result =
          await remoteGithubDataSource.fetchRepoListByUser(username: username);
    } on Exception catch (_) {
      result =
          await localGithubDataSource.fetchRepoListByUser(username: username);
    }

    return result;
  }

  @override
  FutureOr<List<GithubOwner>> fetchGithubUserList({
    required String? username,
  }) async {
    List<GithubOwner> result = <GithubOwner>[];

    try {
      final remoteOwnerListResult =
          await remoteGithubDataSource.fetchGithubUserList(username: username);

      await Future.forEach(remoteOwnerListResult, (element) async {
        final localOwnerFounded = await localGithubDataSource
            .findGithubUserByName(username: element.name);

        element = element.copyWith(isFavorite: localOwnerFounded != null);

        result.add(element);
      });
    } on Exception catch (_) {
      result =
          await localGithubDataSource.fetchGithubUserList(username: username);
    }

    return result;
  }

  @override
  FutureOr<void> favoriteGithubRepo({required GithubRepo value}) async {
    try {
      await localGithubDataSource.favoriteGithubRepo(value: value);
    } on Exception catch (e) {}
  }

  @override
  FutureOr<void> favoriteGithubUser({required GithubOwner value}) async {
    try {
      await localGithubDataSource.favoriteGithubUser(value: value);
    } on Exception catch (e) {}
  }

  @override
  FutureOr<void> unFavoriteGithubUser({required GithubOwner value}) async {
    try {
      await localGithubDataSource.favoriteGithubUser(value: value);
    } on Exception catch (e) {}
  }

  @override
  FutureOr<GithubOwner?> findOwnerOnDatabase({required String name}) async {
    final result =
        await localGithubDataSource.findGithubUserByName(username: name);
    return result;
  }
}
