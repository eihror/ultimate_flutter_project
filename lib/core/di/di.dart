import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class CoreDI {
  static Future<void> initializeDependencies() async {
    final _client = Dio(
      BaseOptions(
        baseUrl: "https://api.github.com/",
        contentType: "application/json; charset=utf-8",
        connectTimeout: const Duration(milliseconds: 10000),
        receiveTimeout: const Duration(milliseconds: 10000),
      ),
    );

    if (!kReleaseMode) {
      _client.interceptors.add(
        PrettyDioLogger(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }

    GetIt.I.registerSingleton<Dio>(
      _client,
    );

    GetIt.I.registerSingleton<Connectivity>(Connectivity());

    GetIt.I.registerLazySingleton<GlobalKey<NavigatorState>>(
      () => GlobalKey(),
    );
  }
}
