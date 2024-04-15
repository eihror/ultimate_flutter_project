import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultimate_flutter_project/features/github/domain/usecase/fetch_repos_by_user_usecase.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_repos/github_repos_ui_event.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_repos/github_repos_ui_state.dart';

class GithubReposBloc extends Bloc<GithubReposUiEvent, GithubReposUiState> {
  GithubReposBloc({
    required this.fetchReposByUserUseCase,
  }) : super(GithubReposUiState()) {
    on<OnInitScreen>(_handleOnInitScreen);
  }

  final FetchReposByUserUseCase fetchReposByUserUseCase;

  FutureOr<void> _handleOnInitScreen(
    OnInitScreen event,
    Emitter<GithubReposUiState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          username: event.username,
          githubRepoList: List.empty(),
        ),
      );

      if (event.username.isNotEmpty) {
        final result = await fetchReposByUserUseCase(username: event.username);

        emit(
          state.copyWith(
            githubRepoList: result,
          ),
        );
      } else {
        emit(
          state.copyWith(
            githubRepoList: List.empty(),
          ),
        );
      }
    } on Exception catch (_) {
      // Handle any error here
    } finally {
      // Remove finally section if is not needed
    }
  }
}
