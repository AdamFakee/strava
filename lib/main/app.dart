import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/l10n/app_localizations.dart';
import 'package:strava/utils/localization/localization_provider.dart';
import 'package:strava/utils/routers/app_routers.dart';
import 'package:strava/utils/themes/states/theme_mode_provider.dart';
import 'package:strava/utils/themes/theme.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> with WidgetsBindingObserver {
  // đăng ký widget 
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // cấu hình hiển thị statusBar và swipeBottomIndicator
    // mục đính: ẩn statusBar và chỉ hiển thị swipeBottomIndicator
    SystemChrome.setEnabledSystemUIMode(
      // tự cấu hình thủ công
      SystemUiMode.manual, 
      // nếu dùng kiểu thủ công thì cần thêm các option
      overlays: [
        // chỉ hiển thị swipeBottomIndicator
        SystemUiOverlay.bottom
      ],
    );
  }

  // trigger khi người dùng thay đổi themeMode của máy họ chứ không thông qua app. Tuy nhiên đây chỉ là thay đổi themMode của app một cách tạm thời chứ k lưu lại. Nếu thoát app vào lại vẫn sẽ dùng themeMode trong storage.
  // còn nếu chỉnh themeMode qua app thì sẽ được lưu vào storage để phục vụ cho các lần dùng app sau này
  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();

    final brightness = View.of(context).platformDispatcher.platformBrightness;
    
    ref.read(sThemeModeProvider.notifier).changeThemeWithSpecificTheme(brightness);
  }

  // huỷ đăng ký nếu như widget bị xoá
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(sThemeModeProvider);
    final locale = ref.watch(sLocalizationProvider);

    return MaterialApp.router(
      theme: SAppThemes.lightTheme,
      themeMode: themeMode,
      darkTheme: SAppThemes.darkTheme,
      debugShowCheckedModeBanner: false,

      // -- router
      routerConfig: SAppRouters.routers,

      // -- set up multi locales
      localizationsDelegates: SAppLanguages.localizationsDelegates,
      supportedLocales: SAppLanguages.supportedLocales,
      locale: locale,
    );
  }
}

// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context, ref) {
//     final themeMode = ref.watch(sThemeModeProvider);
//     final locale = ref.watch(sLocalizationProvider);

//     return MaterialApp.router(
//       theme: SAppThemes.lightTheme,
//       themeMode: themeMode,
//       darkTheme: SAppThemes.darkTheme,
//       debugShowCheckedModeBanner: false,

//       // -- router
//       routerConfig: SAppRouters.routers,

//       // -- set up multi locales
//       localizationsDelegates: SAppLanguages.localizationsDelegates,
//       supportedLocales: SAppLanguages.supportedLocales,
//       locale: locale,
//     );
//   }
// }
