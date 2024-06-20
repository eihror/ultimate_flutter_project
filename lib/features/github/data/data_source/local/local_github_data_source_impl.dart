import 'dart:async';

import 'package:ultimate_flutter_project/database/dao/owner_dao.dart';
import 'package:ultimate_flutter_project/features/github/data/data_source/local/local_github_data_source.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_owner.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_repo.dart';

class LocalGithubDataSourceImpl extends LocalGithubDataSource {
  LocalGithubDataSourceImpl({
    required this.ownerDao,
  });

  final OwnerDao ownerDao;

  @override
  FutureOr<void> favoriteGithubRepo({required GithubRepo value}) {
    // TODO: implement favoriteGithubRepo
    throw UnimplementedError();
  }

  @override
  FutureOr<void> favoriteGithubUser({required GithubOwner value}) {
    // TODO: implement favoriteGithubUser
    throw UnimplementedError();
  }

  @override
  FutureOr<List<GithubOwner>> fetchGithubUserList({
    required String? username,
  }) async {
    // TODO: implement fetchRepoListByUser
    throw UnimplementedError();
  }

  @override
  FutureOr<List<GithubRepo>> fetchRepoListByUser({required String username}) {
    // TODO: implement fetchRepoListByUser
    throw UnimplementedError();
  }
}
