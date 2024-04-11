import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:ultimate_flutter_project/core/routes/app_routes.dart';
import 'package:ultimate_flutter_project/features/authentication/presentation/screen/splash_screen.dart';
import 'package:ultimate_flutter_project/features/github/presentation/screen/github_repos_screen.dart';
import 'package:ultimate_flutter_project/features/github/presentation/screen/github_users_screen.dart';

abstract class AppPages {
  static final GoRouter routes = GoRouter(
    navigatorKey: GetIt.I<GlobalKey<NavigatorState>>(),
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.splash.path,
        name: AppRoutes.splash.name,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutes.githubUsers.path,
        name: AppRoutes.githubUsers.name,
        builder: (context, state) => const GithubUsersScreen(),
      ),
      GoRoute(
        path: AppRoutes.githubRepos.path,
        name: AppRoutes.githubRepos.name,
        builder: (context, state) => const GithubReposScreen(),
      ),
    ],
  );
}
