import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ultimate_flutter_project/features/github/data/data_source/remote/remote_github_data_source.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_owner.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_repo.dart';

class RemoteGithubDataSourceImpl extends RemoteGithubDataSource {
  RemoteGithubDataSourceImpl({
    required this.network,
  });

  final Dio network;

  @override
  FutureOr<List<GithubOwner>> fetchGithubUserList({
    required String? username,
  }) async {
    try {
      late dynamic response;

      if (username == null) {
        response = await network.get<List<dynamic>>("users");
      } else {
        response = await network.get<dynamic>("users/$username");
      }

      if (response.statusCode == 200 || response.statusCode == 204) {
        if (username == null) {
          final data = response.data as List<dynamic>;
          return data
              .map((e) => GithubOwner.fromMap(e as Map<String, dynamic>))
              .toList();
        } else {
          final data = response.data as dynamic;

          return <GithubOwner>[
            GithubOwner.fromMap(data as Map<String, dynamic>),
          ];
        }
      } else {
        return List.empty();
      }
    } on Exception catch (e) {
      return List.empty();
    }
  }

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
