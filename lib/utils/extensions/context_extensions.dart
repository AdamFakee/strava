import 'package:flutter/material.dart';

extension SContextExtensions on BuildContext {
  Size getSize(double percent) => Size(
    MediaQuery.of(this).size.width * percent,
    MediaQuery.of(this).size.height * percent
  );
  double screenHeight() => MediaQuery.of(this).size.height;
  double screenWidht() => MediaQuery.of(this).size.width;

  bool isDarkMode() => MediaQuery.of(this).platformBrightness == Brightness.dark;
}