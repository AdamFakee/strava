import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/utils/routers/bottom_navigations/tabs/home_tab_bottom_navigation.dart';
import 'package:strava/utils/routers/bottom_navigations/tabs/map_tab_bottom_navigation.dart';
import 'package:strava/utils/routers/bottom_navigations/tabs/you_tab_bottom_navigation.dart';
import 'package:strava/utils/routers/widgets/bottom_navigation_widget.dart';

class SBottomNavigation {
  static GlobalKey<NavigatorState> bottomKey = GlobalKey<NavigatorState>();

  static StatefulShellRoute routers = StatefulShellRoute.indexedStack(
    builder:(context, state, navigationShell) {
      return SBottomNavigationWidget(navigationShell: navigationShell);
    },
    branches: [
      SHomeTabBottomNavigation.branch,
      SMapTabBottomNavigation.branch,
      SYouTabBottomNavigation.branch
    ]
  );
}