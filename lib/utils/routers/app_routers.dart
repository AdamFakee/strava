import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/features/core/screens/chat/chat.dart';
import 'package:strava/features/core/screens/map/map.dart';
import 'package:strava/utils/routers/app_router_names.dart';
import 'package:strava/utils/routers/auth_router/auth_router.dart';
import 'package:strava/utils/routers/bottom_navigations/bottom_navigation.dart';

class SAppRouters {
  static GlobalKey<NavigatorState> rootKey = GlobalKey<NavigatorState>();

  static final GoRouter routers = GoRouter(
    navigatorKey: rootKey,
    initialLocation: SAppRouterNames.onboarding,
    restorationScopeId: 'router',
    routes: [
      // Bottom navigation
      SBottomNavigation.routers,
      
      // authentication
      SAuthRouter.router,

      GoRoute(
        parentNavigatorKey: rootKey,
        path: '/map', 
        builder: (context, state) => SMapScreen(),
        routes: [
          GoRoute(
            parentNavigatorKey: rootKey,
            path: 'detail', 
            builder: (context, state) => SMapScreen(),
            routes: [
              
            ]
          )
        ]
      ),

      // chat
      GoRoute(
        parentNavigatorKey: rootKey,
        path: '/chat', 
        builder: (context, state) => SChatScreen(),
        routes: [
          
        ]
      ),
    ],
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;

      // check xem người dùng có đang đi tới route public hay k
      // mặc định: bắt đầu = "/auth" sẽ là route public
      final isPublicRoute = state.fullPath?.startsWith('/auth') ?? false;
      
      // public route
      if(user == null) {
        if(isPublicRoute == false) return SAppRouterNames.onboarding;
        return null;
      }

      // private route
      if(isPublicRoute) {
        return SAppRouterNames.homeTab;
      } else {
        return null;
      }
    },
  ); 
}