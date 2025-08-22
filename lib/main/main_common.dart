import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/main/app.dart';
import 'package:strava/main/app_env.dart';

/// func used for every environment ( dev or product )
Future<void> mainCommon (SAppEnvEnum environment) async {
  // init env
  await SAppEnv.init(environment);

  runApp(ProviderScope(child: MyApp()));
}