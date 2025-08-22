import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/themes/customs/text/text_theme.dart';

class STextFormFieldTheme {
  STextFormFieldTheme._();

  static final _radius = SSizes.borderRadiusSm;
  static final double _borderWidth = 1;

  static InputDecorationTheme darkTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: SAppColors.primary,
    suffixIconColor: SAppColors.primary,
    labelStyle: SAppTextThemes.darkTextTheme.bodyMedium,
    hintStyle: SAppTextThemes.darkTextTheme.bodyMedium,
    errorStyle: SAppTextThemes.darkTextTheme.bodyMedium!.copyWith(color: SAppColors.error),
    floatingLabelStyle: TextStyle(color: Colors.black), ///
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(width: _borderWidth, color: SAppColors.dark.whiteDark),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(width: _borderWidth, color: SAppColors.dark.whiteDark),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(width: _borderWidth, color: SAppColors.dark.whiteDark),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(width: _borderWidth, color: SAppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(width: _borderWidth, color: SAppColors.primary),
    ),
  );

  static InputDecorationTheme lightTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: SAppColors.light.black,
    suffixIconColor: SAppColors.light.black,
    labelStyle: SAppTextThemes.lightTextTheme.bodyMedium,
    hintStyle: SAppTextThemes.lightTextTheme.bodyMedium,
    errorStyle: SAppTextThemes.lightTextTheme.bodyMedium!.copyWith(color: SAppColors.error),
    floatingLabelStyle: TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(width: _borderWidth, color: SAppColors.light.gray),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(width: _borderWidth, color: SAppColors.light.gray),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(width: _borderWidth, color: SAppColors.light.black),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(width: _borderWidth, color: SAppColors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(_radius),
      borderSide: BorderSide(width: _borderWidth, color: SAppColors.primary),
    ),
  );
}
