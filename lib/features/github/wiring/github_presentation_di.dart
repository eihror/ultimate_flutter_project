import 'package:get_it/get_it.dart';
import 'package:ultimate_flutter_project/features/github/domain/usecase/fetch_repos_by_user_usecase.dart';
import 'package:ultimate_flutter_project/features/github/domain/usecase/fetch_user_list_usecase.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_repos/github_repos_bloc.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_users/github_users_bloc.dart';

abstract class GithubPresentationDI {
  static Future<void> initializeDependencies() async {
    GetIt.I.registerFactory<GithubReposBloc>(
      () => GithubReposBloc(
        fetchReposByUserUseCase: GetIt.I<FetchReposByUserUseCase>(),
      ),
    );

    GetIt.I.registerFactory<GithubUsersBloc>(
      () => GithubUsersBloc(
        fetchUserListUserCase: GetIt.I<FetchUserListUserCase>(),
      ),
    );
  }
}
