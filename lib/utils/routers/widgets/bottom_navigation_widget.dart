import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:strava/l10n/app_localizations.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/helpers/helper_function.dart';

class SBottomNavigationWidget extends ConsumerWidget {
  const SBottomNavigationWidget({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, ref) {
    final isDark = SHelperFunction.isDarkMode(ref);
    
    return GestureDetector(
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: (value) {
            _onChangeBottomTab(value, navigationShell);
          },
          destinations: [
            _navigationTab(icon: Icons.home, label: SAppLanguages.of(context)?.home ?? ""),
            _navigationTab(icon: Iconsax.map_1, label: SAppLanguages.of(context)?.map ?? ""),
            _navigationTab(icon: Iconsax.user, label: SAppLanguages.of(context)?.you ?? ""),
          ],
          indicatorColor: SAppColors.primary,
          animationDuration: Duration(milliseconds: 700),
          backgroundColor: isDark ? SAppColors.dark.grayDark : SAppColors.light.whiteDark,
        ),
      ),
    );
  }

  Widget _navigationTab({required IconData icon, required String label}) {
    return NavigationDestination(icon: Icon(icon), label: label);
  }

  void _onChangeBottomTab(int value, StatefulNavigationShell navigationShell) {
    navigationShell.goBranch(
      value,
      initialLocation: value == navigationShell.currentIndex,
    );
  }
}
