import 'dart:async';

import 'package:ultimate_flutter_project/database/dao/owner_dao.dart';
import 'package:ultimate_flutter_project/database/dao/repo_dao.dart';
import 'package:ultimate_flutter_project/database/entity/github_owner_entity.dart';
import 'package:ultimate_flutter_project/features/github/data/data_source/local/local_github_data_source.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_owner.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_repo.dart';

class LocalGithubDataSourceImpl extends LocalGithubDataSource {
  LocalGithubDataSourceImpl({
    required this.ownerDao,
    required this.repoDao,
  });

  final OwnerDao ownerDao;
  final RepoDao repoDao;

  @override
  FutureOr<void> favoriteGithubRepo({required GithubRepo value}) {
    // TODO: implement favoriteGithubRepo
    throw UnimplementedError();
  }

  @override
  FutureOr<void> favoriteGithubUser({required GithubOwner value}) async {
    try {
      await ownerDao.insertOwner(GithubOwnerEntity.fromOwner(value: value));
    } on Exception catch (_) {}
  }

  @override
  FutureOr<void> unFavoriteGithubUser({required GithubOwner value}) async {
    try {
      await ownerDao.deleteOwner(GithubOwnerEntity.fromOwner(value: value));
    } on Exception catch (_) {}
  }

  @override
  FutureOr<List<GithubOwner>> fetchGithubUserList({
    required String? username,
  }) async {
    try {
      List<GithubOwner> result = <GithubOwner>[];
      List<GithubOwnerEntity> dbResult = <GithubOwnerEntity>[];

      if (username == null) {
        dbResult = await ownerDao.fetchAll();
      } else {
        dbResult = await ownerDao.fetchOwnerListByName(username);
      }

      result = dbResult.map((e) => GithubOwner.fromEntity(e)).toList();

      return result;
    } on Exception catch (e) {
      return <GithubOwner>[];
    }
  }

  @override
  FutureOr<List<GithubRepo>> fetchRepoListByUser({
    required String username,
  }) async {
    try {
      final localResult = await repoDao.fetchAllByUser(username);

      final List<GithubRepo> result =
          localResult.map((e) => GithubRepo.fromEntity(e)).toList();

      return result;
    } on Exception catch (e) {
      return <GithubRepo>[];
    }
  }

  @override
  FutureOr<GithubOwner?> findGithubUserByName({
    required String username,
  }) async {
    final result = await ownerDao.fetchOwnerByName(username);
    return result != null ? GithubOwner.fromEntity(result) : null;
  }
}
