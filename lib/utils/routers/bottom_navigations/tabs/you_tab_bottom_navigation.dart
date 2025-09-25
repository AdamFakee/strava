import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/features/personalizations/screens/settings/languages.dart';
import 'package:strava/features/personalizations/screens/settings/settings.dart';
import 'package:strava/features/personalizations/screens/settings/theme_mode.dart';
import 'package:strava/features/personalizations/screens/you/you.dart';
import 'package:strava/utils/routers/app_routers.dart';

class SYouTabBottomNavigation {
  static GlobalKey<NavigatorState> tabKey = GlobalKey<NavigatorState>();

  static StatefulShellBranch get branch => StatefulShellBranch(
    navigatorKey: tabKey,
    routes: [
      GoRoute(
        path: '/you', 
        builder: (context, state) => SYouScreens(),
        routes: [
          GoRoute(
            parentNavigatorKey: SAppRouters.rootKey,
            path: 'settings',
            builder: (context, state) => SSettingsScreen(),
          ),
          GoRoute(
            parentNavigatorKey: SAppRouters.rootKey,
            path: 'language',
            builder: (context, state) => SLanguagesScreen(),
          ),
          GoRoute(
            parentNavigatorKey: SAppRouters.rootKey,
            path: 'themeMode',
            builder: (context, state) => SThemeModeScreens(),
          ),
        ]
      )
    ]
  );
}