import 'package:equatable/equatable.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_owner.dart';

class GithubUsersUiState extends Equatable {
  GithubUsersUiState({
    List<GithubOwner>? githubOwnerList,
  }) : githubOwnerList = githubOwnerList ?? List.empty();

  factory GithubUsersUiState.initialState() {
    return GithubUsersUiState();
  }

  final List<GithubOwner> githubOwnerList;

  @override
  List<Object?> get props => [
        githubOwnerList,
      ];

  GithubUsersUiState copyWith({
    List<GithubOwner>? githubOwnerList,
  }) {
    return GithubUsersUiState(
      githubOwnerList: githubOwnerList ?? this.githubOwnerList,
    );
  }
}
