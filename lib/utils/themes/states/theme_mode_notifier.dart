import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/utils/local_storage/share_preference/share_preference_storage.dart';
import 'package:strava/utils/local_storage/share_preference/share_preference_storage_abstract.dart';
import 'package:strava/utils/local_storage/share_preference/share_preference_storage_keys.dart';

/// a class used for manage state of themMode
class SThemeModeNotifier extends StateNotifier<ThemeMode> {
  // static final SThemeModeNotifier _instance = SThemeModeNotifier._internal();

  // factory SThemeModeNotifier() => _instance;

  final SharePreferenceStorageAbstract _storage = SharePreferenceStorage();


  SThemeModeNotifier(): super(ThemeMode.system) {
    _init();
  }

  void _init () async {
    // delay chờ _storage khởi tạo xong đã
    await Future.delayed(Duration(milliseconds: 50));

    final theme = _storage.get(SharePreferenceStorageKeys.themeMode);
    if(theme == null) {
      state = ThemeMode.system;
      return;
    }
    final value = ThemeMode.values.byName(theme.toString());
    state = value;
  }

  void toggleTheme () async {
    state = state.name == 'dark' ? ThemeMode.light : ThemeMode.dark;
    await _storage.set(SharePreferenceStorageKeys.themeMode, state.name);
  }

  /// lưu vào db local - hỗ trợ systerm/light/dark
  void changeTheme (ThemeMode theme) async {  
    state = theme;
    await _storage.set(SharePreferenceStorageKeys.themeMode, state.name);
  }

  /// k lưu vào db local - chỉ hỗ trợ light/dark
  void changeThemeWithSpecificTheme (Brightness brightness) {
    final isDarkMode = brightness == Brightness.dark;
    
    state = isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
}