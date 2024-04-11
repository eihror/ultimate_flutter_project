abstract class GithubReposUiEvent {}

final class OnInitScreen extends GithubReposUiEvent {}

final class OnUsernameTextChanged extends GithubReposUiEvent {
  OnUsernameTextChanged({
    required this.value,
  });

  final String value;
}
