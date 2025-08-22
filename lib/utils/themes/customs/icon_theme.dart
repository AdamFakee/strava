import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';

class SIconTheme {
  static final _size = SSizes.iconMd;

  static IconThemeData get lightMode => IconThemeData(
    size: _size,
    color: SAppColors.primary
  );

  static IconThemeData get darkMode => IconThemeData(
    size: _size,
    color: SAppColors.primary
  );
}