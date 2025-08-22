import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/utils/routers/bottom_navigations/bottom_navigation.dart';

class SAppRouters {
  static GlobalKey<NavigatorState> get rootKey => GlobalKey<NavigatorState>();

  static GoRouter get routers => GoRouter(
    navigatorKey: rootKey,
    initialLocation: '/home',
    routes: [
      // Bottom navigation
      SBottomNavigation.routers,
    ]
  ); 
}