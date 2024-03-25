import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_flutter_project/core/routes/app_pages.dart';
import 'package:ultimate_flutter_project/core/routes/app_routes.dart';

class Ufp extends StatelessWidget {
  const Ufp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "U.F.P.",
      getPages: AppPages.routes,
      initialRoute: AppRoutes.splash,
    );
  }
}
