import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/themes/customs/text/text_theme.dart';

class SOutlinedButtonTheme {
  static OutlinedButtonThemeData get darkTheme => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: Size(double.infinity, 0),
      backgroundColor: SAppColors.dark.black,
      foregroundColor: SAppColors.dark.black,
      disabledBackgroundColor: SAppColors.primary.withOpacity(0.8),
      disabledForegroundColor: SAppColors.dark.black,
      elevation: SSizes.buttonElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.borderRadiusSm)),
      side: BorderSide(
        color: SAppColors.dark.whiteDark.withOpacity(0.6),
      ),
      textStyle: SAppTextThemes.darkTextTheme.bodyLarge,
      padding: EdgeInsets.symmetric(
        vertical: SSizes.md
      )
    )
  );

  static OutlinedButtonThemeData get lightTheme => OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity, 0),
      backgroundColor: SAppColors.light.white,
      foregroundColor: SAppColors.light.white,
      disabledBackgroundColor: SAppColors.primary.withOpacity(0.8),
      disabledForegroundColor: SAppColors.light.white,
      elevation: SSizes.buttonElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.borderRadiusSm)),
      side: BorderSide(
        color: SAppColors.dark.whiteDark,
      ),
      textStyle: SAppTextThemes.lightTextTheme.bodyLarge,
      padding: EdgeInsets.symmetric(
        vertical: SSizes.md
      ),
    )
  );
}