import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:ultimate_flutter_project/features/home/data/repository/github_repository_impl.dart';
import 'package:ultimate_flutter_project/features/home/domain/repository/github_repository.dart';
import 'package:ultimate_flutter_project/features/home/domain/usecase/fetch_repos_by_user_usecase.dart';
import 'package:ultimate_flutter_project/features/home/presentation/controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GithubRepository>(
      () => GithubRepositoryImpl(
        network: Get.find<Dio>(),
      ),
      fenix: true,
    );

    Get.lazyPut<FetchReposByUserUseCase>(
      () => FetchReposByUserUseCase(
        repository: Get.find<GithubRepository>(),
      ),
      fenix: true,
    );

    Get.create<HomeController>(
      () => HomeController(
        fetchReposByUserUseCase: Get.find<FetchReposByUserUseCase>(),
      ),
    );
  }
}
