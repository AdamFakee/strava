import 'package:flutter/material.dart';
import 'package:strava/common/widgets/appBars/app_bar.dart';
import 'package:strava/common/widgets/auth/button_social_login.dart';
import 'package:strava/common/widgets/deviders/devider_with_text_center.dart';
import 'package:strava/features/authentication/screens/login/widgets/login_form.dart';
import 'package:strava/utils/const/icon_strings.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';

class SLoginScreen extends StatelessWidget {
  const SLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: SSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SSizes.defaultSpace * 1.5,
          children: [
            // Title
            Text(
              STextStrings.createAnAccount,
              style: Theme.of(
                context,
              ).textTheme.headlineLarge!.apply(fontWeightDelta: 2),
            ),

            // authentication
            Column(
              spacing: SSizes.spaceBtwItems * 2,
              children: [
                // login google button
                SButtonSocialLogin(
                  title: STextStrings.continueWithGoogle,
                  iconAsset: SIconStrings.googleLogoSvg,
                  sematicLabel: "login google icon",
                  onPressed: () {

                  },
                ),

                // dividers
                SDeviderWithTextCenter(text: STextStrings.or,),

                // form input
                SLoginForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




