import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/common/widgets/circular_indicator_horizontal.dart';
import 'package:strava/features/core/controllers/home/indicator/indicator_controller_provider.dart';
import 'package:strava/features/core/screens/home/widgets/banner/weekly_progres_banner.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/global.dart';
import 'package:strava/utils/const/sizes.dart';

class SHomeBannerSumaries extends ConsumerWidget {
  const SHomeBannerSumaries({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(SIndicatorControllerProvider.notifier);
    return Column(
      children: [
        Container(
          color: SAppColors.black,
          padding: EdgeInsets.symmetric(horizontal: SSizes.md),
          child: Column(
            children: [
              // page view
              SizedBox(
                height: SSizes.homeBannerHeight,
                child: PageView(
                  onPageChanged: (idx) => provider.move(idx, SGlobals.numOfBannerInHome),
                  children: [
                    SWeeklyProgressBanner(), 
                    SWeeklyProgressBanner()
                  ],
                ),
              ),
              // indicator
              Consumer(
                builder: (context, ref, child) {
                  final currentIdxPage = ref
                      .watch(SIndicatorControllerProvider)
                      .currentIdxPage;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: SSizes.md),
                    child: CircularIndicatorHorizontal(
                      currentIdxPage: currentIdxPage,
                      numberOfPage: SGlobals.numOfBannerInHome,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
