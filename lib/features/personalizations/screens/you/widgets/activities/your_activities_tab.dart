import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/personalizations/controllers/you/activities/activities_controller_provider.dart';
import 'package:strava/features/personalizations/screens/you/widgets/activities/recent_activities_list.dart';
import 'package:strava/features/personalizations/screens/you/widgets/activities/weekly_goal_card.dart';

class SYourActivitiesTab extends ConsumerWidget {
  const SYourActivitiesTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(yourActivitiesControllerProvider);
    final notifier = ref.read(yourActivitiesControllerProvider.notifier);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => notifier.refresh(),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            SWeeklyGoalCard(
              goalKm: state.weeklyGoalKm,
              progress: state.weeklyProgress,
            ),
            const SizedBox(height: 24),
            Text(
              "Recent Activities",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            SRecentActivitiesList(activities: state.recentActivities),
          ],
        ),
      ),
    );
  }
}