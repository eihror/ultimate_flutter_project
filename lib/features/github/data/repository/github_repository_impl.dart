import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ultimate_flutter_project/features/github/data/data_source/local/local_github_data_source.dart';
import 'package:ultimate_flutter_project/features/github/data/data_source/remote/remote_github_data_source.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_owner.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_repo.dart';
import 'package:ultimate_flutter_project/features/github/domain/repository/github_repository.dart';

class GithubRepositoryImpl extends GithubRepository {
  GithubRepositoryImpl({
    required this.localGithubDataSource,
    required this.remoteGithubDataSource,
    required this.connectivity,
  });

  final LocalGithubDataSource localGithubDataSource;
  final RemoteGithubDataSource remoteGithubDataSource;
  final Connectivity connectivity;

  @override
  FutureOr<List<GithubRepo>> fetchRepoListByUser({
    required String username,
  }) async {
    List<GithubRepo> result = <GithubRepo>[];

    final connectivityResult = await connectivity.checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      result =
          await localGithubDataSource.fetchRepoListByUser(username: username);
    } else {
      result =
          await remoteGithubDataSource.fetchRepoListByUser(username: username);
    }

    return result;
  }

  @override
  FutureOr<List<GithubOwner>> fetchGithubUserList({
    required String? username,
  }) {
    return remoteGithubDataSource.fetchGithubUserList(username: username);
  }

  @override
  FutureOr<void> favoriteGithubRepo({required GithubRepo value}) {
    return localGithubDataSource.favoriteGithubRepo(value: value);
  }

  @override
  FutureOr<void> favoriteGithubUser({required GithubOwner value}) {
    return localGithubDataSource.favoriteGithubUser(value: value);
  }
}
