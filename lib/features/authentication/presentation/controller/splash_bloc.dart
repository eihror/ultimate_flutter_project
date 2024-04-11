import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ultimate_flutter_project/core/routes/app_routes.dart';
import 'package:ultimate_flutter_project/features/authentication/presentation/controller/splash_ui_event.dart';

class SplashBloc extends Bloc<SplashUiEvent, void> {
  SplashBloc({
    required this.navigatorState,
  }) : super(null) {
    on<OnInitScreen>(_handleOnInitScreen);
  }

  final GlobalKey<NavigatorState> navigatorState;

  FutureOr<void> _handleOnInitScreen(
    OnInitScreen event,
    Emitter<void> emit,
  ) async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      navigatorState.currentContext?.pushReplacementNamed(
        AppRoutes.githubUsers.name,
      );
    });
  }
}
