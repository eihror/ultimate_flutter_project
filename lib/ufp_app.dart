import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ultimate_flutter_project/core/routes/app_pages.dart';

class UFPApp extends StatelessWidget {
  const UFPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "U.F.P.",
      routerConfig: AppPages.routes,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('pt'), // Portuguese
      ],
    );
  }
}
