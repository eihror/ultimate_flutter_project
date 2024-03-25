import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:ultimate_flutter_project/features/authentication/presentation/controller/splash_bloc.dart';

abstract class SplashDI {
  static Future<void> initializeDependencies() async {
    GetIt.I.registerFactory<SplashBloc>(
      () => SplashBloc(
        navigatorState: GetIt.I<GlobalKey<NavigatorState>>(),
      ),
    );
  }
}
