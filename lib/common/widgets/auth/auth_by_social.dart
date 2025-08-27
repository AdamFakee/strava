import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/common/widgets/auth/button_social_login.dart';
import 'package:strava/features/authentication/controllers/social_auth/social_auth_abstract.dart';
import 'package:strava/features/authentication/controllers/social_auth/social_auth_provider.dart';
import 'package:strava/utils/const/icon_strings.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/const/text_strings.dart';
import 'package:strava/utils/popups/snackbar.dart';

/// show login button with specific social platform
/// 
/// [google], [facebook] variables used to determin which buttons is shown
class SAuthBySocial extends ConsumerWidget {
  const SAuthBySocial({
    super.key,
    this.google = false,
    this.facebook = false
  });

  final bool google;
  final bool facebook;

  @override
  Widget build(BuildContext context, ref) {
    final state = ref.watch(SSocialAuthProvider);
    final provider = ref.read(SSocialAuthProvider.notifier);

    // handle err
    ref.listen<AsyncValue<SSocialAuthStateType>>(
      SSocialAuthProvider, 
      (preState, currState) {
        if(currState.hasError && currState.isLoading == false) {
          SSnackbar.show(context, type: SSnackbarEnum.error, message: currState.error.toString());
        }
      },
    );

    return Column(
      spacing: SSizes.sm,
      children: [
        if(google)
          SButtonSocialLogin(
            iconAsset: SIconStrings.googleLogoSvg,
            title: STextStrings.continueWithGoogle,
            sematicLabel: "login google icon",
            isLoading: state.isLoading && state.value?.socialType == SSocialEnum.google,
            onPressed: () => state.isLoading && state.value?.socialType == SSocialEnum.google ? null : provider.signinWithGoogle(),
          ),
        if(facebook)
          SButtonSocialLogin(
            iconAsset: SIconStrings.facebookLogoSvg,
            title: STextStrings.continueWithFacebook,
            sematicLabel: "login facebook icon",
            isLoading: state.isLoading && state.value?.socialType == SSocialEnum.facebook,
            onPressed: () => state.isLoading && state.value?.socialType == SSocialEnum.facebook ? null : provider.signinWithFacebook(),
          ),
      ],
    );
  }
}
