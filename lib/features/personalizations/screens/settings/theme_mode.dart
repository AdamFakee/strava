import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/common/widgets/appBars/app_bar.dart';
import 'package:strava/features/personalizations/screens/settings/widgets/themes/theme_mode_card.dart';
import 'package:strava/utils/const/image_strings.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/themes/states/theme_mode_provider.dart';

class SThemeModeScreens extends ConsumerWidget {
  const SThemeModeScreens({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = ref.watch(sThemeModeProvider);
    final provider = ref.read(sThemeModeProvider.notifier);
    return Scaffold(
      appBar: SAppBar(
        showBackButton: true,
        title: "Change your theme"
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SSizes.md
        ),
        child: Column(
          spacing: SSizes.md,
          children: [
            SThemeModeCard(
              title: "Default",
              imageString: SImageStrings.themeModeDefault,
              isActive: theme == ThemeMode.system,
              onPress:() => provider.changeTheme(ThemeMode.system),
            ),
            SThemeModeCard(
              title: "Light mode",
              imageString: SImageStrings.themeModeLight,
              isActive: theme == ThemeMode.light,
              onPress:() => provider.changeTheme(ThemeMode.light),
            ),
            SThemeModeCard(
              title: "Dark mode",
              imageString: SImageStrings.themeModeDark,
              isActive: theme == ThemeMode.dark,
              onPress:() => provider.changeTheme(ThemeMode.dark),
            )
          ],
        ),
      ),
    );
  }
}