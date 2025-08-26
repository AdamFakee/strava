import 'package:flutter/material.dart';
import 'package:strava/common/widgets/auth/button_social_login.dart';
import 'package:strava/utils/const/icon_strings.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';

/// show login button with specific social platform
/// 
/// [google], [facebook] variables used to determin which buttons is shown
class SAuthBySocial extends StatelessWidget {
  const SAuthBySocial({
    super.key,
    this.google = false,
    this.facebook = false
  });

  final bool google;
  final bool facebook;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SSizes.sm,
      children: [
        if(google)
          SButtonSocialLogin(
            iconAsset: SIconStrings.googleLogoSvg,
            title: STextStrings.continueWithGoogle,
            sematicLabel: "login google icon",
            onPressed: () {},
          ),
        if(facebook)
          SButtonSocialLogin(
            iconAsset: SIconStrings.facebookLogoSvg,
            title: STextStrings.continueWithFacebook,
            sematicLabel: "login facebook icon",
            onPressed: () {},
          ),
      ],
    );
  }
}
