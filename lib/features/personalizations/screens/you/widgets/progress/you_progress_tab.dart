import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/screens/home/widgets/recentlyImages/detail_activity_dialog.dart';
import 'package:strava/features/personalizations/controllers/you/progress/progress_controller_state.dart';
import 'package:strava/features/personalizations/controllers/you/specific_date/specific_date_controller_provider.dart';
import 'package:strava/features/personalizations/screens/you/widgets/progress/card.dart';
import 'package:strava/features/personalizations/screens/you/widgets/progress/comparison_stat_widget.dart';
import 'package:strava/features/personalizations/screens/you/widgets/progress/weekly_progress_chart.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/extensions/date_time_extensions.dart';
import 'package:strava/utils/extensions/time_extensions.dart';
import 'package:strava/utils/helpers/format_helpers.dart'; // Giả định bạn có file này

class SYouProgressTab extends ConsumerWidget {
  const SYouProgressTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateNotifier = ref.read(SSpecificDateControllerProvider.notifier);
    final dateState = ref.watch(SSpecificDateControllerProvider);
    final progressAsyncValue = ref.watch(progressTabControllerProvider);

    return RefreshIndicator(
      onRefresh: () async { 
        ref.read(progressTabControllerProvider.notifier).refresh();
       },
      child: SingleChildScrollView(
        child: SCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Bộ điều hướng tuần
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () => dateNotifier.previousWeek(),
                  ),
                  Text(
                    dateNotifier.giveNumWeekString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    // Tắt nút nếu đang ở tuần hiện tại
                    onPressed: dateState.numWeek == DateTime.now().weekNumber(DateTime.now())
                        ? null
                        : () => dateNotifier.nextWeek(),
                  ),
                ],
              ),
              const SizedBox(height: SSizes.spaceBtwItems),
        
              // 2. Hiển thị dữ liệu chính (loading, error, data)
              progressAsyncValue.when(
                loading: () => const Center(heightFactor: 5, child: CircularProgressIndicator()),
                error: (err, stack) => Center(child: Text('Error loading activities: $err')),
                data: (progressData) {
                  
                  // 3. Nếu không có hoạt động, hiển thị empty state
                  if (progressData.currentWeekActivities.isEmpty) {
                    return Center(
                      heightFactor: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           const Icon(Icons.directions_run, size: 40, color: Colors.grey),
                           const SizedBox(height: SSizes.md),
                           Text(
                            "No activities this week",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
                           ),
                        ],
                      ),
                    );
                  }
        
                  // 4. Tính toán tổng số liệu tuần hiện tại
                  double totalDistance = 0;
                  int totalTime = 0;
                  for (var activity in progressData.currentWeekActivities) {
                    totalDistance += double.parse(activity.distance);
                    totalTime += int.parse(activity.timer);
                  }
        
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 5. Hiển thị các chỉ số so sánh
                      Row(
                        children: [
                          Expanded(
                            child: ComparisonStatWidget(
                              title: 'Distance',
                              mainValue: '${(totalDistance).toStringAsFixed(2)} km',
                              currentValue: totalDistance,
                              previousValue: progressData.previousWeekDistance,
                              unit: 'km',
                            ),
                          ),
                          const SizedBox(width: SSizes.lg),
                          Expanded(
                            child: ComparisonStatWidget(
                              title: 'Time',
                              mainValue: totalTime.toFormattedString(),
                              currentValue: totalTime / 1.0, // so sánh theo phút
                              previousValue: progressData.previousWeekTime / 1.0,
                              unit: 'mins',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: SSizes.spaceBtwSections),
                      
                      // 6. Biểu đồ
                      SWeeklyProgressChart(),
                      const SizedBox(height: SSizes.spaceBtwSections),
        
                      // 7. Danh sách hoạt động chi tiết
                      Text(
                        'Activities this week (${progressData.currentWeekActivities.length})',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Divider(),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: progressData.currentWeekActivities.length,
                        separatorBuilder: (context, index) => const Divider(),
                        itemBuilder: (context, index) {
                          final activity = progressData.currentWeekActivities[index];
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
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}