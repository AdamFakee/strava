import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:strava/features/authentication/controllers/on_boardings/on_boarding_indicator_provider.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/extensions/context_extensions.dart';

class SOnBoardingIndicator extends ConsumerWidget {
  const SOnBoardingIndicator({super.key});
  
  @override
  Widget build(BuildContext context, ref) {
    final currentIdxPage = ref.watch(sOnBoardingIndicatorProvider);
    final bool isDark = context.isDarkMode();

    return Center(
      child: SmoothIndicator(
        offset: currentIdxPage * 1.0,
        count: 5,
        size: Size(75, 6),
        effect: WormEffect(
          dotWidth: 8, 
          dotHeight: 8,
          dotColor: isDark ? SAppColors.dark.white : SAppColors.light.black.withOpacity(0.2),
          activeDotColor: SAppColors.primary
        ),
      ),
    );
  }
}
