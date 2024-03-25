import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ultimate_flutter_project/features/home/domain/model/github_repo.dart';
import 'package:ultimate_flutter_project/features/home/domain/repository/github_repository.dart';

class GithubRepositoryImpl extends GithubRepository {
  GithubRepositoryImpl({
    required this.network,
  });

  final Dio network;

  @override
  FutureOr<List<GithubRepo>> fetchRepoListByUser({
    required String username,
  }) async {
    try {
      final response =
          await network.get<List<dynamic>>("users/$username/repos");

      if (response.statusCode == 200 || response.statusCode == 204) {
        final data = response.data as List<dynamic>;

        return data
            .map((e) => GithubRepo.fromMap(e as Map<String, dynamic>))
            .toList();
      } else {
        return List.empty();
      }
    } on Exception catch (e) {
      return List.empty();
    }
  }
}
