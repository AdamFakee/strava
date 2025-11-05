import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/common/widgets/texts/text_with_value_vertical.dart';
import 'package:strava/features/core/controllers/maps/distance/distance_controller_provider.dart';
import 'package:strava/features/core/controllers/maps/timer/timer_controller_provider.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/helpers/format_helpers.dart';
import 'package:strava/utils/helpers/helper_function.dart';

/// widget hiển thị các thông số về thời gian, pace, khoảng cách di chuyển
class SActivityStats extends StatelessWidget {
  const SActivityStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.minPositive,
      margin: EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
      padding: EdgeInsets.symmetric(
        horizontal: SSizes.defaultSpace,
        vertical: SSizes.sm,
      ),
      decoration: BoxDecoration(
        color: SAppColors.dark.black,
        borderRadius: BorderRadius.circular(SSizes.sm),
      ),
      child: Column(
        children: [
          // thông số
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.9,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              // thông số về thời gian
              Consumer(
                builder: (context, ref, child) {
                  final time = ref.watch(STimerControllerProvider).time;

                  return STextWithValueVertical(title: 'Time', value: SFormatHelpers.secondToTimeClock(time));
                },
              ),
              // thông số về pace ( pace = km/h, phụ thuộc vào time & distance )
              Consumer(builder:(context, ref, child) {
                final time = ref.watch(STimerControllerProvider).time;
                final distance = ref
                      .watch(SDistanceControllerProvider)
                      .distance;
                return STextWithValueVertical(title: "Pace (km/h)", value: SHelperFunction.calculateRunningPace(distance, time));
              },),

              // thông số về khoảng cách di chuyển
              Consumer(
                builder: (context, ref, child) {
                  final distance = ref
                      .watch(SDistanceControllerProvider)
                      .distance;

                  return STextWithValueVertical(
                    title: "Distance (km)",
                    value: distance.toStringAsFixed(1),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
