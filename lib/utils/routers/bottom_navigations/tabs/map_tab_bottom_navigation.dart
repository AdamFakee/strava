import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/features/core/screens/map/map.dart';
import 'package:strava/utils/routers/app_routers.dart';

// tab này tạo ra với mục đích fake tab "map" và nó không được sử dụng
// tab map thật thì sẽ được đẩy ra ngang cấp với bottom tab
// đoạn này nghiên cứu khắc phục sau
class SMapTabBottomNavigation {
  static GlobalKey<NavigatorState> tabKey = GlobalKey<NavigatorState>();

  static StatefulShellBranch get branch => StatefulShellBranch(
    navigatorKey: tabKey,
    routes: [
      GoRoute(
        // parentNavigatorKey: SAppRouters.rootKey,
        path: '/nhap', 
        builder: (context, state) => SizedBox.shrink(),
        routes: [
          GoRoute(
            parentNavigatorKey: SAppRouters.rootKey,
            path: 'detail', 
            builder: (context, state) => SMapScreen(),
            routes: [
              
            ]
          )
        ]
      )
    ]
  );
}