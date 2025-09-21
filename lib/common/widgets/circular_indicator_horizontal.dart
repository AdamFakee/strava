import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/extensions/context_extensions.dart';

class CircularIndicatorHorizontal extends StatelessWidget{
  const CircularIndicatorHorizontal({super.key, required this.currentIdxPage, required this.numberOfPage});
  
  final int currentIdxPage;
  final int numberOfPage;

  @override
  Widget build(BuildContext context) {
    final bool isDark = context.isDarkMode();

    return Center(
      child: SmoothIndicator(
        offset: currentIdxPage * 1.0,
        count: numberOfPage,
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

