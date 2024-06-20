import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ultimate_flutter_project/database/database.dart';
import 'package:ultimate_flutter_project/features/github/data/data_source/local/local_github_data_source.dart';
import 'package:ultimate_flutter_project/features/github/data/data_source/local/local_github_data_source_impl.dart';
import 'package:ultimate_flutter_project/features/github/data/data_source/remote/remote_github_data_source.dart';
import 'package:ultimate_flutter_project/features/github/data/data_source/remote/remote_github_data_source_impl.dart';
import 'package:ultimate_flutter_project/features/github/data/repository/github_repository_impl.dart';
import 'package:ultimate_flutter_project/features/github/domain/repository/github_repository.dart';

abstract class GithubDataDI {
  static Future<void> initializeDependencies() async {
    GetIt.I.registerLazySingleton<LocalGithubDataSource>(
      () => LocalGithubDataSourceImpl(
        ownerDao: GetIt.I<AppDatabase>().ownerDao,
      ),
    );

    GetIt.I.registerLazySingleton<RemoteGithubDataSource>(
      () => RemoteGithubDataSourceImpl(
        network: GetIt.I<Dio>(),
      ),
    );

    GetIt.I.registerLazySingleton<GithubRepository>(
      () => GithubRepositoryImpl(
        localGithubDataSource: GetIt.I<LocalGithubDataSource>(),
        remoteGithubDataSource: GetIt.I<RemoteGithubDataSource>(),
        connectivity: GetIt.I<Connectivity>(),
      ),
    );
  }
}
