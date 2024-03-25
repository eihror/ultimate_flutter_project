import 'package:equatable/equatable.dart';
import 'package:ultimate_flutter_project/features/home/domain/model/github_repo.dart';

class HomeUiState extends Equatable {
  HomeUiState({
    List<GithubRepo>? githubRepoList,
  }) : githubRepoList = githubRepoList ?? List.empty();

  factory HomeUiState.initialState() {
    return HomeUiState();
  }

  final List<GithubRepo> githubRepoList;

  @override
  List<Object?> get props => [
        githubRepoList,
      ];

  HomeUiState copyWith({
    List<GithubRepo>? githubRepoList,
  }) {
    return HomeUiState(
      githubRepoList: githubRepoList ?? this.githubRepoList,
    );
  }
}
