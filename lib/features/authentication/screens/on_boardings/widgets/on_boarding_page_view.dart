import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/authentication/controllers/on_boardings/on_boarding_indicator_provider.dart';
import 'package:strava/features/authentication/screens/on_boardings/widgets/on_boarding_page.dart';
import 'package:strava/utils/const/global.dart';
import 'package:strava/utils/const/image_strings.dart';
import 'package:strava/utils/const/text_strings.dart';

class SOnBoardingPageView extends ConsumerWidget {
  const SOnBoardingPageView({
    super.key,
  });

  static const List<Widget> onBoardingPages = [
    SOnBoardingPage(
      title: STextStrings.onboardingTitle1,
      image: SImageStrings.on_boarding_gen_image_with_result,
    ),
    SOnBoardingPage(
      title: STextStrings.onboardingTitle2,
      image: SImageStrings.on_boarding_result_after_running,
    ),
    SOnBoardingPage(
      title: STextStrings.onboardingTitle3,
      image: SImageStrings.on_boarding_runner_step,
    ),
    SOnBoardingPage(
      title: STextStrings.onboardingTitle4,
      image: SImageStrings.on_boarding_share_result,
    ),
    SOnBoardingPage(
      title: STextStrings.onboardingTitle5,
      image: SImageStrings.on_boarding_track_your_ride,
    ),
  ];

  @override
  Widget build(BuildContext context, ref) {
    final indicatorProvider = ref.read(sOnBoardingIndicatorProvider.notifier);

    const int numOfPageviews = SGlobals.numOfPageViews;

    assert(onBoardingPages.length == numOfPageviews, 'const page = $numOfPageviews differ onBoardingPages.length = ${onBoardingPages.length}');
    
    return PageView.builder(
      controller: indicatorProvider.controller,
      onPageChanged: indicatorProvider.changeIdxInPageView,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return index >= onBoardingPages.length ? onBoardingPages[index % numOfPageviews] : onBoardingPages[index];
      },
    );
  }
}
