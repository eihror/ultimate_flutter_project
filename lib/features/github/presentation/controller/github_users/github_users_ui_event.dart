abstract class GithubUsersUiEvent {}

final class OnInitScreen extends GithubUsersUiEvent {}

final class OnUsernameTextChanged extends GithubUsersUiEvent {
  OnUsernameTextChanged({
    required this.value,
  });

  final String value;
}

final class ClickedOnGithubUserTile extends GithubUsersUiEvent {
  ClickedOnGithubUserTile({
    required this.username,
  });

  final String username;
}
