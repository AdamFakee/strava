import 'package:flutter/material.dart';
import 'package:strava/common/widgets/appBars/app_bar.dart';
import 'package:strava/common/widgets/auth/auth_by_social.dart';
import 'package:strava/common/widgets/auth/auth_main_title.dart';
import 'package:strava/common/widgets/deviders/devider_with_text_center.dart';
import 'package:strava/features/authentication/screens/login/widgets/login_form.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';

class SLoginScreen extends StatelessWidget {
  const SLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(showBackButton: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SSizes.md,
          children: [
            // title
            SAuthMainTitle(title: STextStrings.loginToStrava),

            // buttons auth
            SAuthBySocial(
              facebook: true, google: true,
            ),

            // devider
            SDeviderWithTextCenter(text: STextStrings.or),

            // form login
            SLoginForm(),

          ],
        ),
      ),
    );
  }
}



