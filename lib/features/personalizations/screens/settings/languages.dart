import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/common/widgets/appBars/app_bar.dart';
import 'package:strava/features/personalizations/screens/settings/widgets/languages/language_card.dart';
import 'package:strava/utils/const/icon_strings.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/localization/localization_notifier.dart';
import 'package:strava/utils/localization/localization_provider.dart';

class SLanguagesScreen extends ConsumerWidget {
  const SLanguagesScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final provider = ref.read(sLocalizationProvider.notifier);
    final locale = ref.watch(sLocalizationProvider);
    return Scaffold(
      appBar: SAppBar(
        showBackButton: true,
        title: "Change your language"
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: SSizes.md
        ),
        child: Column(
          spacing: SSizes.sm,
          children: [
            SLanguageCard(
              title: "English",
              imageString: SIconStrings.english,
              isActive: locale.languageCode == SLocalizationEnum.en.name,
              onPress: () => provider.changeLocale(SLocalizationEnum.en)
            ),
            SLanguageCard(
              title: "Vietnamese",
              imageString: SIconStrings.vietName,
              isActive: locale.languageCode == SLocalizationEnum.vi.name,
              onPress: () => provider.changeLocale(SLocalizationEnum.vi)
            )
          ],
        ),
      ),
    );
  }
}