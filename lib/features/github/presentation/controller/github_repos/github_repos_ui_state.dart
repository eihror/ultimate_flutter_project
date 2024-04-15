import 'package:equatable/equatable.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_repo.dart';

class GithubReposUiState extends Equatable {
  GithubReposUiState({
    List<GithubRepo>? githubRepoList,
    this.username = "",
  }) : githubRepoList = githubRepoList ?? List.empty();

  factory GithubReposUiState.initialState() {
    return GithubReposUiState();
  }

  final List<GithubRepo> githubRepoList;
  final String username;

  @override
  List<Object?> get props => [
        githubRepoList,
        username,
      ];

  GithubReposUiState copyWith({
    List<GithubRepo>? githubRepoList,
    String? username,
  }) {
    return GithubReposUiState(
      username: username ?? this.username,
      githubRepoList: githubRepoList ?? this.githubRepoList,
    );
  }
}
