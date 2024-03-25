import 'package:get/get.dart';
import 'package:ultimate_flutter_project/core/routes/app_routes.dart';
import 'package:ultimate_flutter_project/features/authentication/presentation/screen/splash_screen.dart';
import 'package:ultimate_flutter_project/features/authentication/wiring/splash_binding.dart';
import 'package:ultimate_flutter_project/features/home/presentation/screen/home_screen.dart';
import 'package:ultimate_flutter_project/features/home/wiring/home_binding.dart';

abstract class AppPages {
  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: SplashScreen.new,
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: HomeScreen.new,
      binding: HomeBinding(),
    ),
  ];
}
