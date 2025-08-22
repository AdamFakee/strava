// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class SAppColors {
  const SAppColors._();

  static const primary = Color(0xFFE9602A);
  static const Color error = Colors.red;

  // color for specific themeMode
  static final dark = _DarkMode();
  static final light = _LightMode();
}

class _DarkMode {
  _DarkMode();

  final Color black = Color(0xFF393939);
  final Color grayDark = Color(0xFF494949);
  final Color white = Color(0xFFFFFFFF);
  final Color gray = Color(0xFF949494);
  final Color whiteDark = Color(0xFFCCCCCC);
}

class _LightMode {
  _LightMode();

  final Color black = Color(0xFF000000);
  final Color grayDark = Color(0xFF49484F);
  final Color gray = Color(0xFFCCCCCC);
  final Color white = Color(0xFFFFFFFF);
  final Color whiteDark = Color(0xFFF7F7F7);
}
