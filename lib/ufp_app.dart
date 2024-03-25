import 'package:flutter/material.dart';
import 'package:ultimate_flutter_project/core/routes/app_pages.dart';

class UFPApp extends StatelessWidget {
  const UFPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "U.F.P.",
      routerConfig: AppPages.routes,
    );
  }
}
