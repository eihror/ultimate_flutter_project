import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ultimate_flutter_project/core/util/debouncer.dart';
import 'package:ultimate_flutter_project/features/github/domain/usecase/fetch_user_list_usecase.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_users/github_users_ui_event.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_users/github_users_ui_side_effect.dart';
import 'package:ultimate_flutter_project/features/github/presentation/controller/github_users/github_users_ui_state.dart';

class GithubUsersBloc extends Bloc<GithubUsersUiEvent, GithubUsersUiState> {
  GithubUsersBloc({
    required this.fetchUserListUserCase,
  }) : super(GithubUsersUiState()) {
    on<OnInitScreen>(_handleOnInitScreen);
    on<OnUsernameTextChanged>(_handleOnUsernameTextChanged);
    on<ClickedOnGithubUserTile>(_handleClickedOnGithubUserTile);
  }

  final TextEditingController userNameTextEditingController =
      TextEditingController();

  final FetchUserListUserCase fetchUserListUserCase;

  final _debouncer = Debouncer(
    milliseconds: 500,
  );

  FutureOr<void> _handleListener({
    required Emitter<GithubUsersUiState> emit,
  }) async {
    userNameTextEditingController.addListener(() {
      if (userNameTextEditingController.text.isEmpty) {
        add(
          OnUsernameTextChanged(
            value: "",
          ),
        );
      } else {
        _debouncer.run(() {
          add(
            OnUsernameTextChanged(
              value: userNameTextEditingController.text,
            ),
          );
        });
      }
    });
  }

  FutureOr<void> _handleOnInitScreen(
    OnInitScreen event,
    Emitter<GithubUsersUiState> emit,
  ) async {
    await _fetchGithubUserList(emit: emit);
    _handleListener(emit: emit);
  }

  FutureOr<void> _handleOnUsernameTextChanged(
    OnUsernameTextChanged event,
    Emitter<GithubUsersUiState> emit,
  ) async {
    try {
      emit(
        state.copyWith(githubOwnerList: List.empty()),
      );

      final result = await fetchUserListUserCase(
        name: event.value.isNotEmpty ? event.value : null,
      );

      emit(
        state.copyWith(
          githubOwnerList: result,
        ),
      );
    } on Exception catch (e) {
      // Handle any error here
    } finally {
      // Remove finally section if is not needed
    }
  }

  FutureOr<void> _fetchGithubUserList({
    required Emitter<GithubUsersUiState> emit,
  }) async {
    try {
      emit(
        state.copyWith(
          githubOwnerList: List.empty(),
        ),
      );

      final result = await fetchUserListUserCase(name: null);

      emit(
        state.copyWith(
          githubOwnerList: result,
        ),
      );
    } on Exception catch (_) {
      // Handle any error here
    } finally {
      // Remove finally section if is not needed
    }
  }

  FutureOr<void> _handleClickedOnGithubUserTile(
    ClickedOnGithubUserTile event,
    Emitter<GithubUsersUiState> emit,
  ) async {
    emit(
      state.copyWith(
        uiSideEffect: NavigateToGithubUserRepos(
          username: event.username,
        ),
      ),
    );
  }
}
