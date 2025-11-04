import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/models/weekly_activity_model.dart';
import 'package:strava/features/personalizations/controllers/you/activities/activities_controller_provider.dart';
import 'package:strava/utils/const/colors.dart';


/// Widget hiển thị thẻ mục tiêu tuần
class SWeeklyGoalCard extends ConsumerWidget {
  const SWeeklyGoalCard({super.key, 
    required this.goalKm,
    required this.progress,
  });

  final double goalKm;
  final AsyncValue<SWeeklyActivityModel> progress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Weekly Goal",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold
                  ),
                ),
                TextButton(
                  onPressed: () => _showSetGoalDialog(context, ref, goalKm),
                  child: const Text("Set Goal"),
                )
              ],
            ),
            const SizedBox(height: 16),
            progress.when(
              data: (weeklyData) {
                final currentKm = weeklyData.totalDistance;
                final progressValue = (goalKm > 0) ? (currentKm / goalKm).clamp(0.0, 1.0) : 0.0;
                final percentage = (progressValue * 100).toStringAsFixed(0);

                return Row(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          CircularProgressIndicator(
                            value: progressValue,
                            strokeWidth: 8,
                            backgroundColor: Colors.grey.shade300,
                            valueColor: const AlwaysStoppedAnimation<Color>(SAppColors.primary),
                          ),
                          Center(
                            child: Text(
                              "$percentage%",
                              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${currentKm.toStringAsFixed(2)} / ${goalKm.toStringAsFixed(1)} km",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 4),
                         Text(
                          "Total of ${weeklyData.totalActivities} activities this week.",
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    )
                  ],
                );
              },
              error: (e, s) => const Center(child: Text("Could not load progress")),
              loading: () => const Center(child: CircularProgressIndicator()),
            )
          ],
        ),
      ),
    );
  }

  void _showSetGoalDialog(BuildContext context, WidgetRef ref, double currentGoal) {
    final controller = TextEditingController(text: currentGoal.toStringAsFixed(0));
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Set Weekly Goal (km)"),
          content: TextField(
            controller: controller,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d*'))],
            decoration: const InputDecoration(
              labelText: "Distance in km",
            ),
            autofocus: true,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            FilledButton(
              onPressed: () {
                final newGoal = double.tryParse(controller.text);
                if (newGoal != null) {
                  ref.read(yourActivitiesControllerProvider.notifier).setWeeklyGoal(newGoal);
                }
                Navigator.of(context).pop();
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }
}
