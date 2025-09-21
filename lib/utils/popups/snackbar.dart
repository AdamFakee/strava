import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';

enum SSnackbarEnum { success, warning, error }

/// class display [SSnackbarEnum] popup
/// 
/// [type] determine type of popup 
/// 
/// [second] : time display popup
class SSnackbar {
  static show(BuildContext context, {
    required SSnackbarEnum type,
    required String message,
    int seconds = 3
  }) {
    final IconData icon;
    final IconData trailing;
    final Color bgColor;

    // set value for type's variables
    switch (type) {
      case SSnackbarEnum.success:
        icon = Icons.check_circle;
        bgColor = SAppColors.success;
        trailing = Icons.close;
        break;
      case SSnackbarEnum.warning:
        icon = Icons.warning;
        bgColor = SAppColors.warning;
        trailing = Icons.close;
        break;
      case SSnackbarEnum.error:
        icon = Icons.error;
        bgColor = SAppColors.error;
        trailing = Icons.close;
        break;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: ListTile(
          leading: Icon(icon, color: SAppColors.light.white,),
          title: Text(message.length > 250 ? message.substring(0, 250) : message, style: TextStyle(
            color: SAppColors.light.white
          ),),
          trailing: Icon(trailing, color: SAppColors.light.white,),
        ),
        backgroundColor: bgColor,
        margin: EdgeInsets.all(SSizes.md),
        padding: EdgeInsets.symmetric(
          horizontal: SSizes.xs,
          vertical: SSizes.xs * 1.3
        ),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SSizes.borderRadiusLg)
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: seconds),
      )
    );
  }
}