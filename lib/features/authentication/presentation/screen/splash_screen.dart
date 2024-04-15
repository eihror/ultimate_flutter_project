import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ultimate_flutter_project/core/extension/context_extension.dart';
import 'package:ultimate_flutter_project/features/authentication/presentation/controller/splash_bloc.dart';
import 'package:ultimate_flutter_project/features/authentication/presentation/controller/splash_ui_event.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<SplashBloc>()..add(OnInitScreen()),
      child: BlocBuilder<SplashBloc, void>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.amber,
            body: Center(
              child: Text(context.i18n.screenSplashTitle),
            ),
          );
        },
      ),
    );
  }
}
