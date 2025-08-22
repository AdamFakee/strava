import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/utils/local_storage/share_preference/share_preference_storage.dart';
import 'package:strava/utils/local_storage/share_preference/share_preference_storage_abstract.dart';
import 'package:strava/utils/local_storage/share_preference/share_preference_storage_keys.dart';

// ignore: constant_identifier_names
enum SLocalizationEnum { en, vi }

/// a class used for change language
class SLocalizationNotifier extends StateNotifier<Locale>{
  static final SLocalizationNotifier _instance = SLocalizationNotifier._internal();

  factory SLocalizationNotifier() => _instance;

  SLocalizationNotifier._internal(): super(Locale(SLocalizationEnum.vi.name)) {
    _init();
  }

  final SharePreferenceStorageAbstract _storage = SharePreferenceStorage();

  void _init () {
    final locale = _storage.get(SharePreferenceStorageKeys.language);
    if(locale == null) {
      state = Locale(SLocalizationEnum.vi.name);
      return;
    }

    state = Locale(_getLocale(locale.toString()).name);
  }

  void changeLocale (SLocalizationEnum locale) async {
    await _storage.set(SharePreferenceStorageKeys.language, locale.name);

    state = Locale(locale.name);
  }

  SLocalizationEnum _getLocale(String locale) {
    switch (locale) {
      case "en":
        return SLocalizationEnum.en;
      case "vi":
        return SLocalizationEnum.vi;
      default:
        return SLocalizationEnum.vi; 
    }
  }
}