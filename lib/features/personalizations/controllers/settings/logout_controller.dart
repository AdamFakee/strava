import 'package:flutter/material.dart';
import 'package:strava/data/repos/user/user_repo.dart';
import 'package:strava/features/personalizations/controllers/settings/logout_controller_abstract.dart';
import 'package:strava/utils/exceptions/handle_exception/handle_controller_exeption.dart';
import 'package:strava/utils/popups/confirm_popup.dart';
import 'package:strava/utils/popups/fullscreen_loader.dart';

class SLogoutController implements SLogoutControllerAbstract {
  // variables
  final _userRepos = SUserRepos();

  @override
  void logout(BuildContext context) async {
    await SHandleControllerExeption(context, () async {
      // confirm popup
      final confirm = await SConfirmPopup.show(
        context: context,
      );
      if(confirm == false) {
        return;
      }

      // loading
      SFullscreenLoader.show(context);

      await _userRepos.logout();

      // stop loading
      SFullscreenLoader.stop(context);
    });
  }
  
}