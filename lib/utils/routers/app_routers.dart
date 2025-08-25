import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/utils/routers/auth_router/auth_router.dart';
import 'package:strava/utils/routers/bottom_navigations/bottom_navigation.dart';

class SAppRouters {
  static GlobalKey<NavigatorState> get rootKey => GlobalKey<NavigatorState>();

  static final GoRouter routers = GoRouter(
    navigatorKey: rootKey,
    initialLocation: '/onboarding',
    restorationScopeId: 'router',
    routes: [
      // Bottom navigation
      SBottomNavigation.routers,
      
      // authentication
      SAuthRouter.router,
    ]
  ); 
}