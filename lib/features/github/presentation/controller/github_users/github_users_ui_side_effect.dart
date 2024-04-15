abstract class GithubUserUiSideEffect {}

final class NavigateToGithubUserRepos extends GithubUserUiSideEffect {
  NavigateToGithubUserRepos({
    required this.username,
  });

  final String username;
}
