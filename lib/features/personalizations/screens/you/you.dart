import 'package:flutter/material.dart';
import 'package:strava/features/personalizations/screens/you/widgets/activities/your_activities_tab.dart';
import 'package:strava/features/personalizations/screens/you/widgets/progress/you_progress_tab.dart';
import 'package:strava/features/personalizations/screens/you/widgets/tab_bar.dart';
import 'package:strava/utils/const/colors.dart';

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

              },
              icon: Icon(Icons.settings)
            )
          ],
          bottom: const TabBar(
            indicatorColor: SAppColors.primary,
            tabs: [
              STabBar(title: "Progress"),
              STabBar(title: "Activities"),
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