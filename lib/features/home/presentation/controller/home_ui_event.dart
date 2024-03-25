abstract class HomeUiEvent {}

final class OnInitScreen extends HomeUiEvent {}

final class OnUsernameTextChanged extends HomeUiEvent {
  OnUsernameTextChanged({
    required this.value,
  });

  final String value;
}
