import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:ultimate_flutter_project/features/home/domain/usecase/fetch_repos_by_user_usecase.dart';
import 'package:ultimate_flutter_project/features/home/presentation/controller/home_ui_event.dart';
import 'package:ultimate_flutter_project/features/home/presentation/controller/home_ui_state.dart';

class HomeController extends GetxController {
  HomeController({
    required this.fetchReposByUserUseCase,
  });

  final FetchReposByUserUseCase fetchReposByUserUseCase;

  final TextEditingController userNameTextEditingController =
      TextEditingController();

  final Rx<HomeUiState> _uiState = Rx<HomeUiState>(HomeUiState.initialState());

  HomeUiState get uiState => _uiState.value;

  final _debouncer = Debouncer(
      delay: const Duration(
    milliseconds: 500,
  ));

  FutureOr<void> onUiEvent({
    required HomeUiEvent event,
  }) async {
    switch (event) {
      case OnInitScreen _:
        handleOnInitScreen();
      case OnUsernameTextChanged event:
        handleOnUsernameTextChanged(event: event);
    }
  }

  FutureOr<void> handleOnInitScreen() async {
    _handleListener();
  }

  FutureOr<void> handleOnUsernameTextChanged({
    required OnUsernameTextChanged event,
  }) async {
    try {
      _uiState.value = uiState.copyWith(
        githubRepoList: List.empty(),
      );

      if (event.value.isNotEmpty) {
        final result = await fetchReposByUserUseCase(username: event.value);

        _uiState.value = uiState.copyWith(
          githubRepoList: result,
        );
      } else {
        _uiState.value = uiState.copyWith(
          githubRepoList: List.empty(),
        );
      }
    } on Exception catch (_) {
      // Handle any error here
    } finally {
      // Remove finally section if is not needed
    }
  }

  FutureOr<void> _handleListener() async {
    userNameTextEditingController.addListener(() {
      _debouncer.call(() {
        onUiEvent(
          event: OnUsernameTextChanged(
            value: userNameTextEditingController.text,
          ),
        );
      });
    });
  }
}
