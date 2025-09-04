import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/utils/themes/states/theme_mode_provider.dart';

class SHelperFunction {

  /// fucntion used for check themeMode in this device
  static bool isDarkMode (WidgetRef ref) {
    return ref.watch(sThemeModeProvider) == ThemeMode.dark;
  }

  /// function used for read json file
  static Future<String> readJsonByFilePath (String filePath) async {
    return await rootBundle.loadString(filePath);
  }

  /// Calculates running speed in kilometers per hour (km/h).
  ///
  /// [distanceKm] total distance in kilometers.
  /// [totalSeconds] total time in seconds.
  ///
  /// Returns a string with one decimal place, e.g. `12.3 km/h`.
  static String calculateRunningPace(double distanceKm, int totalSeconds) {
    if(distanceKm == 0 || totalSeconds == 0) return "0.0";
    
    double hours = totalSeconds / 3600.0;
    double speed = distanceKm / hours;

    return speed.toStringAsFixed(1);
  }
}