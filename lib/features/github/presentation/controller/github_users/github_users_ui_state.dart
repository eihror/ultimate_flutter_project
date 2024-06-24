import 'package:equatable/equatable.dart';
import 'package:ultimate_flutter_project/features/github/domain/model/github_owner.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_users/github_users_ui_side_effect.dart';

class GithubUsersUiState extends Equatable {
  GithubUsersUiState({
    List<GithubOwner>? githubOwnerList,
    this.uiSideEffect,
  }) : githubOwnerList = githubOwnerList ?? List.empty();

  factory GithubUsersUiState.initialState() {
    return GithubUsersUiState();
  }

  final List<GithubOwner> githubOwnerList;
  final GithubUserUiSideEffect? uiSideEffect;

  @override
  List<Object?> get props => [
        githubOwnerList,
        uiSideEffect,
      ];

  GithubUsersUiState copyWith({
    List<GithubOwner>? githubOwnerList,
    GithubUserUiSideEffect? uiSideEffect,
  }) {
    return GithubUsersUiState(
      githubOwnerList: githubOwnerList ?? this.githubOwnerList,
      uiSideEffect: uiSideEffect ?? this.uiSideEffect,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is GithubUsersUiState &&
          runtimeType == other.runtimeType &&
          githubOwnerList == other.githubOwnerList &&
          uiSideEffect == other.uiSideEffect;

  @override
  int get hashCode =>
      super.hashCode ^ githubOwnerList.hashCode ^ uiSideEffect.hashCode;
}
