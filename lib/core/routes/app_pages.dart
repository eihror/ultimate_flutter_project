import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:ultimate_flutter_project/features/authentication/presentation/screen/splash_screen.dart';
import 'package:ultimate_flutter_project/features/home/presentation/screen/home_screen.dart';

abstract class AppPages {
  static final GoRouter routes = GoRouter(
    navigatorKey: GetIt.I<GlobalKey<NavigatorState>>(),
    routes: <RouteBase>[
      GoRoute(
        path: "/",
        name: "splash",
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: "/home",
        name: "home",
        builder: (context, state) => HomeScreen(),
      ),
    ],
  );
}
