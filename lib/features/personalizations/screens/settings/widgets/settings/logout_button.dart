import 'package:flutter/material.dart';
import 'package:strava/features/personalizations/controllers/settings/logout_controller.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';

class SLogoutButton extends StatelessWidget {
  const SLogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SLogoutController();

    return Padding(
      padding: const EdgeInsets.all(SSizes.md),
      child: OutlinedButton(
        onPressed: () {
          controller.logout(context);
        }, 
        child: Text("Log out", style: Theme.of(context).textTheme.displayLarge!.apply(
          color: SAppColors.primary
        ),)
      ),
    );
  }
}