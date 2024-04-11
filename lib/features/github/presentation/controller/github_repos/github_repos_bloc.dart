import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultimate_flutter_project/core/util/debouncer.dart';
import 'package:ultimate_flutter_project/features/github/domain/usecase/fetch_repos_by_user_usecase.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_repos/github_repos_ui_event.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_repos/github_repos_ui_state.dart';

class GithubReposBloc extends Bloc<GithubReposUiEvent, GithubReposUiState> {
  GithubReposBloc({
    required this.fetchReposByUserUseCase,
  }) : super(GithubReposUiState()) {
    on<OnInitScreen>(_handleOnInitScreen);
    on<OnUsernameTextChanged>(_handleOnUsernameTextChanged);
  }

  final FetchReposByUserUseCase fetchReposByUserUseCase;

  final TextEditingController userNameTextEditingController =
      TextEditingController();

  final _debouncer = Debouncer(
    milliseconds: 500,
  );

  FutureOr<void> _handleListener() async {
    userNameTextEditingController.addListener(() {
      _debouncer.run(() {
        add(
          OnUsernameTextChanged(
            value: userNameTextEditingController.text,
          ),
        );
      });
    });
  }

  FutureOr<void> _handleOnInitScreen(
    OnInitScreen event,
    Emitter<GithubReposUiState> emit,
  ) async {
    _handleListener();
  }

  FutureOr<void> _handleOnUsernameTextChanged(
    OnUsernameTextChanged event,
    Emitter<GithubReposUiState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          githubRepoList: List.empty(),
        ),
      );

      if (event.value.isNotEmpty) {
        final result = await fetchReposByUserUseCase(username: event.value);

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
