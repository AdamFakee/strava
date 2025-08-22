import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/utils/themes/states/theme_mode_provider.dart';

class SHelperFunction {

  /// fucntion used for check themeMode in this device
  static bool isDarkMode (WidgetRef ref) {
    return ref.watch(sThemeModeProvider) == ThemeMode.dark;
  }
}