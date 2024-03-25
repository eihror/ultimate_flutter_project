import 'dart:async';

import 'package:get/get.dart';
import 'package:ultimate_flutter_project/core/routes/app_routes.dart';
import 'package:ultimate_flutter_project/features/authentication/presentation/controller/splash_ui_event.dart';

class SplashController extends GetxController {
  FutureOr<void> onUiEvent({
    required SplashUiEvent event,
  }) async {
    switch (event) {
      case OnInitScreen event:
        handleOnInitScreen();
    }
  }

  FutureOr<void> handleOnInitScreen() async {
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamed(AppRoutes.home);
    });
  }
}
