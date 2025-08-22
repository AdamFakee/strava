import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/features/personalizations/screens/you/you.dart';

class SYouTabBottomNavigation {
  static GlobalKey<NavigatorState> tabKey = GlobalKey<NavigatorState>();

  static StatefulShellBranch get branch => StatefulShellBranch(
    navigatorKey: tabKey,
    routes: [
      GoRoute(
        path: '/you', 
        builder: (context, state) => SYouScreens(),
        routes: []
      )
    ]
  );
}