import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/themes/customs/text/text_theme.dart';

class SAppbarTheme {
  static AppBarTheme get darkTheme => AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(size: 22, color: SAppColors.dark.white, weight: 20),
    actionsPadding: EdgeInsets.only(right: SSizes.md),
    titleSpacing: SSizes.md,
    scrolledUnderElevation: 0,
    titleTextStyle: SAppTextThemes.darkTextTheme.displayLarge,
    actionsIconTheme: IconThemeData(size: 24, color: SAppColors.primary)
  );

  static AppBarTheme get lightTheme => AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(size: 22, color: SAppColors.light.black, weight: 20),
    titleSpacing: SSizes.md,
    actionsPadding: EdgeInsets.only(right: SSizes.md),
    scrolledUnderElevation: 0,
    titleTextStyle: SAppTextThemes.darkTextTheme.displayLarge,
    actionsIconTheme: IconThemeData(size: 24, color: SAppColors.primary)
  );
}