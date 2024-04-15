abstract class GithubReposUiEvent {}

final class OnInitScreen extends GithubReposUiEvent {
  OnInitScreen({
    required this.username,
  });

  final String username;
}
