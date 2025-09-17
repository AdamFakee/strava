import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/extensions/context_extensions.dart';

class SFullscreenLoader {
  static show (BuildContext context) {
    showDialog(
      context: context, 
      builder:(ctx) {
        return SizedBox(
          height: ctx.screenHeight(),
          width: ctx.screenWidht(),
          child: Center(
            child: CircularProgressIndicator(
              color: SAppColors.primary,
            ),
          ),
        );
      },
    );
  }

  static stop (BuildContext context) => Navigator.pop(context);
}