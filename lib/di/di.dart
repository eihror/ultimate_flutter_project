import 'package:ultimate_flutter_project/core/di/di.dart';
import 'package:ultimate_flutter_project/features/authentication/wiring/splash_di.dart';
import 'package:ultimate_flutter_project/features/home/wiring/home_di.dart';

abstract class DI {
  static Future<void> initializeDependencies() async {
    CoreDI.initializeDependencies();
    SplashDI.initializeDependencies();
    HomeDI.initializeDependencies();
  }
}
