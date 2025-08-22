import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/themes/customs/text/text_styles.dart';

class SAppTextThemes {
  static TextTheme get darkTextTheme {
    return TextTheme(
      bodyLarge: SAppTextStyles.bodyLg.copyWith(color: SAppColors.dark.white),
      bodyMedium: SAppTextStyles.body.copyWith(color: SAppColors.dark.white),
      titleMedium: SAppTextStyles.bodySm.copyWith(color: SAppColors.dark.white),
      titleSmall: SAppTextStyles.bodyXs.copyWith(color: SAppColors.dark.white),
      displayLarge: SAppTextStyles.h1.copyWith(color: SAppColors.dark.white),
      displayMedium: SAppTextStyles.h2.copyWith(color: SAppColors.dark.white),
      displaySmall: SAppTextStyles.h3.copyWith(color: SAppColors.dark.white),
      headlineMedium: SAppTextStyles.h4.copyWith(color: SAppColors.dark.white),
    );
  }

  static TextTheme get lightTextTheme {
    return TextTheme(
      bodyLarge: SAppTextStyles.bodyLg.copyWith(color: SAppColors.light.black),
      bodyMedium: SAppTextStyles.body.copyWith(color: SAppColors.light.black),
      titleMedium: SAppTextStyles.bodySm.copyWith(color: SAppColors.light.black),
      titleSmall: SAppTextStyles.bodyXs.copyWith(color: SAppColors.light.black),
      displayLarge: SAppTextStyles.h1.copyWith(color: SAppColors.light.black),
      displayMedium: SAppTextStyles.h2.copyWith(color: SAppColors.light.black),
      displaySmall: SAppTextStyles.h3.copyWith(color: SAppColors.light.black),
      headlineMedium: SAppTextStyles.h4.copyWith(color: SAppColors.light.black),
    );
  }
}
