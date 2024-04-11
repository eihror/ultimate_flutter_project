abstract class GithubUsersUiEvent {}

final class OnInitScreen extends GithubUsersUiEvent {}

final class OnUsernameTextChanged extends GithubUsersUiEvent {
  OnUsernameTextChanged({
    required this.value,
  });

  final String value;
}
