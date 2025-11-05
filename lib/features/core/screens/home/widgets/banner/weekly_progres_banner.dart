import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/common/widgets/loading_indicators/circular/circular_loading_indicator.dart';
import 'package:strava/features/core/controllers/home/weekly_process/weekly_process_controller_state.dart';
import 'package:strava/features/core/screens/home/widgets/banner/home_bar_summaries_heading_title.dart';
import 'package:strava/features/core/screens/home/widgets/banner/progress_weekly_vertical.dart';
import 'package:strava/l10n/app_localizations.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/routers/app_router_names.dart';


class SWeeklyProgressBanner extends StatelessWidget {
  const SWeeklyProgressBanner({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = SWeeklyProcessController();
    
    return Column(
      children: [
        // title
        SHomeBarSummarySectionTitle(
          title: SAppLanguages.of(context)!.yourWeekly,
          buttonTitlte: SAppLanguages.of(context)!.seeMore,
          onPressed: () {
            context.push(SAppRouterNames.youTab);
          }
        ),

        // content
        FutureBuilder(
          future: controller.getPreviousAndCurrentWeekly(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SCircularLoadingIndicator();
            }
        
            final data = snapshot.data!;
            final previousWeek = data[0];
            final currentWeek = data[1];
        
            return Padding(
              padding: const EdgeInsets.only(bottom: SSizes.sm),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: SSizes.lg,
                children: [
                  SProgressWeeklyVertical(
                    title: SAppLanguages.of(context)!.activities,
                    currentWeekValue: currentWeek.totalActivities * 1.0,
                    previousWeekValue:
                        previousWeek.totalActivities * 1.0,
                  ),
                  SProgressWeeklyVertical(
                    title: SAppLanguages.of(context)!.time,
                    currentWeekValue: currentWeek.totalTimer * 1.0,
                    previousWeekValue: previousWeek.totalTimer * 1.0,
                  ),
                  SProgressWeeklyVertical(
                    title: SAppLanguages.of(context)!.distance,
                    currentWeekValue: currentWeek.totalDistance * 1.0,
                    previousWeekValue: previousWeek.totalDistance * 1.0,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
