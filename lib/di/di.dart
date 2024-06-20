import 'package:ultimate_flutter_project/core/di/di.dart';
import 'package:ultimate_flutter_project/database/wiring/database_di.dart';
import 'package:ultimate_flutter_project/features/authentication/wiring/splash_di.dart';
import 'package:ultimate_flutter_project/features/github/wiring/github_di.dart';

abstract class DI {
  static Future<void> initializeDependencies() async {
    CoreDI.initializeDependencies();
    DatabaseDI.injectDependencies();
    SplashDI.initializeDependencies();
    GithubDI.initializeDependencies();
  }
}
