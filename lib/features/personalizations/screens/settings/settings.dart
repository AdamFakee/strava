import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:strava/common/widgets/appBars/app_bar.dart';
import 'package:strava/features/personalizations/screens/settings/widgets/settings/logout_button.dart';
import 'package:strava/features/personalizations/screens/settings/widgets/settings/setting_feature.dart';
import 'package:strava/utils/routers/app_router_names.dart';

class SSettingsScreen extends StatelessWidget {
  const SSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SAppBar(
        showBackButton: true,
        title: "Settings",
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SSettingFeature(
                title: "Languages", 
                icon: Icons.language,
                onPress: () {
                  context.push(SAppRouterNames.languages);
                }
              ),
              SSettingFeature(
                title: "Theme mode", 
                icon: Icons.dark_mode,
                onPress: () {
                  context.push(SAppRouterNames.themeMode);
                }
              ), 
            ],
          ),
      
          // logout
          SLogoutButton()
        ],
      ),
    );
  }
}