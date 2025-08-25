import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/features/authentication/screens/on_boardings/widgets/on_boarding_indicator.dart';
import 'package:strava/features/authentication/screens/on_boardings/widgets/on_boarding_page_view.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';
import 'package:strava/utils/routers/app_router_names.dart';

class SOnBoardingScreens extends StatelessWidget {
  const SOnBoardingScreens({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // page view
          Expanded(
            child: SOnBoardingPageView(),
          ),

          // indicator
          SOnBoardingIndicator(),
          // auth button
          Padding(
            padding: const EdgeInsets.all(SSizes.defaultSpace * 0.8),
            child: Column(
              spacing: SSizes.md,
              children: [
                // register button
                ElevatedButton(
                  onPressed: () {
                    context.push(SAppRouterNames.login);
                  },
                  child: Text(STextStrings.joinForFree),
                ),

                // login button
                ElevatedButton(
                  onPressed: () {
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: SAppColors.light.whiteDark,
                    side: BorderSide.none,
                    elevation: SSizes.buttonElevation / 2,
                    // backgroundBuilder:(context, states, child) {
                      
                    // },
                  ),
                  child: Text(
                    STextStrings.login,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.apply(color: SAppColors.light.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

