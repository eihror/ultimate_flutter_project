import 'package:ultimate_flutter_project/features/github/domain/model/github_owner.dart';

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

final class ClickedOnFavoriteUser extends GithubUsersUiEvent {
  ClickedOnFavoriteUser({
    required this.owner,
  });

  final GithubOwner owner;
}
