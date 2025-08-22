import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/utils/localization/localization_notifier.dart';

final sLocalizationProvider = StateNotifierProvider<SLocalizationNotifier, Locale>((_) {
  return SLocalizationNotifier();
});