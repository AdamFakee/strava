import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/features/core/screens/map/map.dart';

class SMapTabBottomNavigation {
  static GlobalKey<NavigatorState> tabKey = GlobalKey<NavigatorState>();

  static StatefulShellBranch get branch => StatefulShellBranch(
    navigatorKey: tabKey,
    routes: [
      GoRoute(
        path: '/map', 
        builder: (context, state) => SMapScreen(),
        routes: []
      )
    ]
  );
}