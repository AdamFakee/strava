import 'package:flutter/material.dart';
import 'package:strava/common/widgets/appBars/app_bar.dart';
import 'package:strava/features/authentication/screens/sendCode/widgets/verify_email_code.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';

class SWriteCodeScreen extends StatelessWidget {
  const SWriteCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(showBackButton: true),
      body: Padding(
        padding: EdgeInsetsGeometry.all(SSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // core
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: SSizes.spaceBtwItems,
              children: [
                // titlle + email is sent
                Text(
                  STextStrings.weSentYouACode,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(text: STextStrings.plsEnterEmailCode),

                      WidgetSpan(child: SizedBox(height: SSizes.md)),

                      TextSpan(text: STextStrings.myEmail),
                    ],
                  ),
                ),

                // verify email code
                VerifyEmailCode(),
              ],
            ),

            // go to gmail app
            TextButton(
              onPressed: () {},
              child: Text(
                STextStrings.openEmailApp,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
