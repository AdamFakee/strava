import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/utils/routers/app_router_names.dart';
import 'package:strava/utils/routers/auth_router/auth_router.dart';
import 'package:strava/utils/routers/bottom_navigations/bottom_navigation.dart';

class SAppRouters {
  static GlobalKey<NavigatorState> get rootKey => GlobalKey<NavigatorState>();

  static final GoRouter routers = GoRouter(
    navigatorKey: rootKey,
    initialLocation: SAppRouterNames.onboarding,
    restorationScopeId: 'router',
    routes: [
      // Bottom navigation
      SBottomNavigation.routers,
      
      // authentication
      SAuthRouter.router,
    ],
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      final isPrivateRoute = state.fullPath?.startsWith('/auth') ?? false;

      // public route
      if(user == null) {
        if(isPrivateRoute == false) return SAppRouterNames.onboarding;
        return null;
      }

      // private route
      return SAppRouterNames.homeTab;
    },
  ); 
}