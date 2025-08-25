import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/features/authentication/screens/login/login.dart';
import 'package:strava/features/authentication/screens/on_boardings/on_boardings.dart';
import 'package:strava/features/authentication/screens/sendCode/alert_send_email.dart';
import 'package:strava/features/authentication/screens/sendCode/write_code.dart';

class SAuthRouter {
  static GoRoute get router => GoRoute(
    path: '/',
    builder: (context, state) => const SizedBox.shrink(), 
    routes: [
      // on_boarding
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => SOnBoardingScreens(),
      ),

      // login
      GoRoute(path: '/login', builder: (context, state) => SLoginScreen()),

      // send verify code to email
      GoRoute(
        path: '/sendCodeToEmail',
        builder: (context, state) => const SizedBox.shrink(),
        routes: [
          GoRoute(
            path: 'alter',
            builder: (context, state) => SAlertSendEmailScreen(),
          ),
          GoRoute(
            path: 'write',
            builder: (context, state) => SWriteCodeScreen(),
          ),
        ],
      ),
    ],
  );
}
