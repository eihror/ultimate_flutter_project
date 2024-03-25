import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_flutter_project/features/authentication/presentation/controller/splash_controller.dart';
import 'package:ultimate_flutter_project/features/authentication/presentation/controller/splash_ui_event.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    controller.onUiEvent(event: OnInitScreen());

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Text("Splash Screen"),
      ),
    );
  }
}
