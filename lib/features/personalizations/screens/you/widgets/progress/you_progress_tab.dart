import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/personalizations/controllers/you/specific_date/specific_date_controller_provider.dart';
import 'package:strava/features/personalizations/screens/you/widgets/progress/card.dart';
import 'package:strava/features/personalizations/screens/you/widgets/progress/vertical_stat_text.dart';
import 'package:strava/features/personalizations/screens/you/widgets/progress/weekly_progress_chart.dart';
import 'package:strava/utils/const/sizes.dart';

class SYouProgressTab extends StatelessWidget {
  const SYouProgressTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SCard(
      child: Column(
        spacing: SSizes.md,
        children: [
          // calendar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer(
                builder: (context, ref, child) {
                  final _ = ref.watch(SSpecificDateControllerProvider.select((state) => state.numWeek));
                  final controller = ref.read(SSpecificDateControllerProvider.notifier);

                  return Text(controller.giveNumWeekString());
                },
              )

              // TextButton(
              //   onPressed: () {
              //     SCalanderDialog.show(context);
              //   }, 
              //   child: Text("Date")
              // )
            ],
          ),
          // total stats
          Row(
            spacing: SSizes.lg,
            children: [
              SVerticalStatText(
                title: 'Distance',
                subTitle: "0 km",
              ),
              SVerticalStatText(
                title: 'Time',
                subTitle: "0 m",
              )
            ],
          ),

          // chart 
          SWeeklyProgressChart()
        ],
      ),
    );
  }
}
