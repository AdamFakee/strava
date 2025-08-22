import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/themes/customs/text/text_theme.dart';

class SAppbarTheme {
  static AppBarTheme get darkTheme => AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(size: 24, color: SAppColors.dark.black),
    scrolledUnderElevation: 0,
    titleTextStyle: SAppTextThemes.darkTextTheme.displayLarge,
    actionsIconTheme: IconThemeData(size: 24, color: SAppColors.primary)
  );

  static AppBarTheme get lightTheme => AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(size: 24, color: SAppColors.light.white),
    scrolledUnderElevation: 0,
    titleTextStyle: SAppTextThemes.darkTextTheme.displayLarge,
    actionsIconTheme: IconThemeData(size: 24, color: SAppColors.primary)
  );
}