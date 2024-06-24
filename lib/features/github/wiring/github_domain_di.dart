import 'package:get_it/get_it.dart';
import 'package:ultimate_flutter_project/features/github/domain/repository/github_repository.dart';
import 'package:ultimate_flutter_project/features/github/domain/usecase/favorite_owner_usecase.dart';
import 'package:ultimate_flutter_project/features/github/domain/usecase/fetch_repos_by_user_usecase.dart';
import 'package:ultimate_flutter_project/features/github/domain/usecase/fetch_user_list_usecase.dart';

abstract class GithubDomainDI {
  static Future<void> initializeDependencies() async {
    GetIt.I.registerLazySingleton<FetchReposByUserUseCase>(
      () => FetchReposByUserUseCase(
        repository: GetIt.I<GithubRepository>(),
      ),
    );

    GetIt.I.registerLazySingleton<FetchUserListUserCase>(
      () => FetchUserListUserCase(
        repository: GetIt.I<GithubRepository>(),
      ),
    );

    GetIt.I.registerLazySingleton<FavoriteOwnerUseCase>(
      () => FavoriteOwnerUseCase(
        repository: GetIt.I<GithubRepository>(),
      ),
    );
  }
}
