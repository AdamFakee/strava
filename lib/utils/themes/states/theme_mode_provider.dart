import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/utils/themes/states/theme_mode_notifier.dart';

final sThemeModeProvider = StateNotifierProvider<SThemeModeNotifier, ThemeMode>((ref) {
  return SThemeModeNotifier();
});