import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';

class SButtonCommonStyle {
  static final ButtonStyle blackBg = ElevatedButton.styleFrom(
    backgroundColor: SAppColors.dark.black,
    side: BorderSide(
      color: Color.fromARGB(255, 122, 123, 119),
      width: 2
    ),
  );
}