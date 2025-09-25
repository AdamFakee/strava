import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/routers/app_router_names.dart';

class SButtonBack extends StatelessWidget {
  const SButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.replace(SAppRouterNames.homeTab),
      child: Container(
        decoration: BoxDecoration(
          color: SAppColors.primary,
          borderRadius: BorderRadius.circular(SSizes.all)
        ),
        child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.white,
          )
      ),
    );
  }
}