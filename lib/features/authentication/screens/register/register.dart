import 'package:flutter/material.dart';
import 'package:strava/common/widgets/appBars/app_bar.dart';
import 'package:strava/common/widgets/auth/auth_by_social.dart';
import 'package:strava/common/widgets/auth/auth_main_title.dart';
import 'package:strava/common/widgets/deviders/devider_with_text_center.dart';
import 'package:strava/features/authentication/screens/register/widgets/register_form.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';

class SRegisterScreen extends StatelessWidget {
  const SRegisterScreen({super.key});

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
            SAuthMainTitle(title: STextStrings.createAnAccount),

            // authentication
            Column(
              spacing: SSizes.spaceBtwItems * 2,
              children: [
                // auth button
                SAuthBySocial(google: true,),

                // dividers
                SDeviderWithTextCenter(text: STextStrings.or,),

                // form input
                SRegisterForm(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




