import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/extensions/context_extensions.dart';

/// show widget contain 2 divider horizontal and text in the middle
/// 
/// like: ------ this is text -------
class SDeviderWithTextCenter extends StatelessWidget {
  const SDeviderWithTextCenter({
    super.key,
    required this.text
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode();

    return Row(
      children: [
        Expanded(
          child: Divider(
            color: isDark ? SAppColors.light.white : SAppColors.dark.whiteDark,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: SSizes.md,
          ),
          child: Text(text),
        ),
        Expanded(
          child: Divider(
            color: isDark ? SAppColors.light.white : SAppColors.dark.whiteDark,
            thickness: 1,
          ),
        ),
      ],
    );
  }
}