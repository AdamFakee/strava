import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/data/repos/user/user_repo.dart';
import 'package:strava/firebase_options.dart';
import 'package:strava/main/app.dart';
import 'package:strava/main/app_env.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:strava/utils/database/database.dart';
import 'package:strava/utils/routers/app_routers.dart';

/// func used for every environment ( dev or product )
Future<void> mainCommon (SAppEnvEnum environment) async {
  // init env
  await SAppEnv.init(environment);

  // init Sqflite database
  await SDatabase().init();

  // init firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then(
    (_) => {}
  );

  // listen when firebase auth state change
  FirebaseAuth.instance.authStateChanges().listen((user) {
    // set up for user. If exits
    SUserRepos().setupForCurrentUser(); 

    // refresh route
    SAppRouters.routers.refresh();
  }); 

  runApp(ProviderScope(child: MyApp()));
}