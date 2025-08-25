import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/themes/customs/appbar_theme.dart';
import 'package:strava/utils/themes/customs/elevation_button_theme.dart';
import 'package:strava/utils/themes/customs/icon_theme.dart';
import 'package:strava/utils/themes/customs/outlined_button_theme.dart';
import 'package:strava/utils/themes/customs/text/text_theme.dart';
import 'package:strava/utils/themes/customs/text_form_field_theme.dart';

class SAppThemes {
  /// dark-mode
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: SAppColors.primary,
      scaffoldBackgroundColor: SAppColors.dark.black,
      textTheme: SAppTextThemes.darkTextTheme,
      appBarTheme: SAppbarTheme.darkTheme,
      elevatedButtonTheme: SElevationButtonTheme.darkTheme,
      outlinedButtonTheme: SOutlinedButtonTheme.darkTheme,
      inputDecorationTheme: STextFormFieldTheme.darkTheme,
      iconTheme: SIconTheme.darkMode
    );
  }

  /// light-mode
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: SAppColors.primary,
      scaffoldBackgroundColor: SAppColors.light.white,
      textTheme: SAppTextThemes.lightTextTheme,
      appBarTheme: SAppbarTheme.lightTheme,
      elevatedButtonTheme: SElevationButtonTheme.lightTheme,
      outlinedButtonTheme: SOutlinedButtonTheme.lightTheme,
      inputDecorationTheme: STextFormFieldTheme.lightTheme,
      iconTheme: SIconTheme.lightMode
    );
  }
}