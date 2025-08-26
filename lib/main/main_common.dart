import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/firebase_options.dart';
import 'package:strava/main/app.dart';
import 'package:strava/main/app_env.dart';
import 'package:firebase_core/firebase_core.dart';

/// func used for every environment ( dev or product )
Future<void> mainCommon (SAppEnvEnum environment) async {
  // init env
  await SAppEnv.init(environment);

  // init firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (_) => {}
  );

  runApp(ProviderScope(child: MyApp()));
}