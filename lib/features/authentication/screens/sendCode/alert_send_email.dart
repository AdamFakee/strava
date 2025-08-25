import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/common/widgets/appBars/app_bar.dart';
import 'package:strava/utils/const/image_strings.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';
import 'package:strava/utils/routers/app_router_names.dart';

class SAlertSendEmailScreen extends StatelessWidget {
  const SAlertSendEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(showBackButton: true),
      body: Padding(
        padding: EdgeInsets.only(
          left: SSizes.defaultSpace,
          right: SSizes.defaultSpace,
          bottom: SSizes.defaultSpace,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text
            Column(
              spacing: SSizes.sm,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  STextStrings.switchToOneTimeTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  STextStrings.switchToOneTimeSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),

            // center image
            Image.asset(SImageStrings.strava_logo_icon_svg),

            // button
            ElevatedButton(
              onPressed: () {
                context.push(SAppRouterNames.writeEmailCodeGiven);
              },
              child: Text(
                STextStrings.emailMeACode,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
