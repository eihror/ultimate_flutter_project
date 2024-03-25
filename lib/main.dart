import 'package:flutter/material.dart';
import 'package:ultimate_flutter_project/di/di.dart';
import 'package:ultimate_flutter_project/ufp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DI.initializeDependencies();

  runApp(const Ufp());
}
