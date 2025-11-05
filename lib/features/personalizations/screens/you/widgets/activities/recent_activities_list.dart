import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/models/activity_model.dart';
import 'package:strava/features/core/screens/home/widgets/recentlyImages/detail_activity_dialog.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/helpers/format_helpers.dart';

/// Widget hiển thị danh sách hoạt động gần đây
class SRecentActivitiesList extends StatelessWidget {
  const SRecentActivitiesList({super.key, 
    required this.activities,
  });

  final AsyncValue<List<SActivityModel>> activities;

  @override
  Widget build(BuildContext context) {
    return activities.when(
      data: (activityList) {
        if (activityList.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("No activities found. Let's go for a run!"),
            ),
          );
        }
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: activityList.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            final activity = activityList[index];
            return ListTile(
              onTap: () {
                SDetailActivityDialog.show(context, activity);
              },
              leading: const Icon(Icons.run_circle_outlined, color: SAppColors.primary, size: 36),
              title: Text("Distance: ${double.parse(activity.distance).toStringAsFixed(1)} km"),
              subtitle: Text("Time: ${SFormatHelpers.secondToTimeClock(
                              int.parse(activity.timer),
                            )} - Pace: ${activity.pace} /km"),
              trailing: Text(
                activity.createAt?.substring(0, 10) ?? "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            );
          },
        );
      },
      error: (e, s) => const Center(child: Text("Could not load activities")),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}