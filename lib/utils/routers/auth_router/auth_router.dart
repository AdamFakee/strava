import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/features/authentication/screens/on_boardings/on_boardings.dart';

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
    ],
  );
}
