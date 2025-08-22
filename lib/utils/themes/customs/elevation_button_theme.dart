import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/themes/customs/text/text_theme.dart';

class SElevationButtonTheme {
  static ElevatedButtonThemeData get darkTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: SAppColors.primary,
      foregroundColor: SAppColors.dark.black,
      disabledBackgroundColor: SAppColors.primary.withOpacity(0.8),
      disabledForegroundColor: SAppColors.dark.black,
      elevation: SSizes.buttonElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.borderRadiusSm)),
      side: BorderSide(
        color: SAppColors.primary.withOpacity(0.4),
      ),
      textStyle: SAppTextThemes.darkTextTheme.bodyLarge,
      padding: EdgeInsets.symmetric(
        vertical: SSizes.md
      )
    )
  );

  static ElevatedButtonThemeData get lightTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: SAppColors.primary,
      foregroundColor: SAppColors.light.white,
      disabledBackgroundColor: SAppColors.primary.withOpacity(0.8),
      disabledForegroundColor: SAppColors.light.white,
      elevation: SSizes.buttonElevation,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(SSizes.borderRadiusSm)),
      side: BorderSide(
        color: SAppColors.primary.withOpacity(0.4),
      ),
      textStyle: SAppTextThemes.lightTextTheme.bodyLarge,
      padding: EdgeInsets.symmetric(
        vertical: SSizes.md
      ),
    )
  );
}