import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:ultimate_flutter_project/features/home/data/repository/github_repository_impl.dart';
import 'package:ultimate_flutter_project/features/home/domain/repository/github_repository.dart';
import 'package:ultimate_flutter_project/features/home/domain/usecase/fetch_repos_by_user_usecase.dart';
import 'package:ultimate_flutter_project/features/home/presentation/controller/home_bloc.dart';

abstract class HomeDI {
  static Future<void> initializeDependencies() async {
    GetIt.I.registerLazySingleton<GithubRepository>(
      () => GithubRepositoryImpl(
        network: GetIt.I<Dio>(),
      ),
    );

    GetIt.I.registerLazySingleton<FetchReposByUserUseCase>(
      () => FetchReposByUserUseCase(
        repository: GetIt.I<GithubRepository>(),
      ),
    );

    GetIt.I.registerFactory<HomeBloc>(
      () => HomeBloc(
        fetchReposByUserUseCase: GetIt.I<FetchReposByUserUseCase>(),
      ),
    );
  }
}
