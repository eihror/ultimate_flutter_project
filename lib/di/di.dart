import 'package:ultimate_flutter_project/core/di/di.dart';

abstract class DI {
  static Future<void> initializeDependencies() async {
    CoreDI.initializeDependencies();
  }
}
