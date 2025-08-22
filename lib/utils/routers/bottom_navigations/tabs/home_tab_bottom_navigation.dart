import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/features/core/screens/home/home.dart';

class SHomeTabBottomNavigation {
  static GlobalKey<NavigatorState> tabKey = GlobalKey<NavigatorState>();

  static StatefulShellBranch get branch => StatefulShellBranch(
    navigatorKey: tabKey,
    routes: [
      GoRoute(
        path: '/home', 
        builder: (context, state) => SHomeScreen(),
        routes: []
      )
    ],
  );
}
