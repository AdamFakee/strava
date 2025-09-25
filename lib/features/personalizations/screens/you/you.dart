import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/features/personalizations/screens/you/widgets/activities/your_activities_tab.dart';
import 'package:strava/features/personalizations/screens/you/widgets/progress/you_progress_tab.dart';
import 'package:strava/features/personalizations/screens/you/widgets/tab_bar.dart';
import 'package:strava/l10n/app_localizations.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/routers/app_router_names.dart';

class SYouScreens extends StatelessWidget {
  const SYouScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                context.push(SAppRouterNames.settings);
              },
              icon: Icon(Icons.settings)
            )
          ],
          bottom: TabBar(
            indicatorColor: SAppColors.primary,
            tabs: [
              STabBar(title: SAppLanguages.of(context)!.progress),
              STabBar(title: SAppLanguages.of(context)!.activities),
            ]
          ),
        ),
        body: TabBarView(
          children: [
            SYouProgressTab(),
            SYourActivitiesTab()
          ],
        ),
      ),
    );
  }
}