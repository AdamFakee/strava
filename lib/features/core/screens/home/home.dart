import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/features/core/screens/home/widgets/banner/home_banner_summaries.dart';
import 'package:strava/features/core/screens/home/widgets/chart/weekly_chart.dart';
import 'package:strava/features/core/screens/home/widgets/recentlyImages/recently_images.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/extensions/context_extensions.dart';
import 'package:strava/utils/routers/app_router_names.dart';

class SHomeScreen extends ConsumerWidget {
  const SHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dark = context.isDarkMode();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Xỏ giày vào đê",
          style: TextStyle(color: Colors.red),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push(SAppRouterNames.chat),
            icon: Icon(CupertinoIcons.chat_bubble_2)
          ),
        ],
        backgroundColor: dark ? SAppColors.dark.grayDark.withAlpha(140) : SAppColors.light.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            // banner for: summary result, suggest...
            SHomeBannerSumaries(),
            
            // weekly chart
            SWeeklyChart(),

            // recently images for activities
            SRecentlyImages()
          ],
        ),
      ),
    );
  }
}

