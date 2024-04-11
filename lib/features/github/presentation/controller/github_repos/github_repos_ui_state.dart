import 'package:equatable/equatable.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_repo.dart';

class GithubReposUiState extends Equatable {
  GithubReposUiState({
    List<GithubRepo>? githubRepoList,
  }) : githubRepoList = githubRepoList ?? List.empty();

  factory GithubReposUiState.initialState() {
    return GithubReposUiState();
  }

  final List<GithubRepo> githubRepoList;

  @override
  List<Object?> get props => [
        githubRepoList,
      ];

  GithubReposUiState copyWith({
    List<GithubRepo>? githubRepoList,
  }) {
    return GithubReposUiState(
      githubRepoList: githubRepoList ?? this.githubRepoList,
    );
  }
}
