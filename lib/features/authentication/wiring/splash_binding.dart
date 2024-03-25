import 'package:get/get.dart';
import 'package:ultimate_flutter_project/features/authentication/presentation/controller/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.create<SplashController>(
      () => SplashController(),
    );
  }
}
