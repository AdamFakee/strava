import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/extensions/context_extensions.dart';

class SCheckBoxInnerCircle extends StatelessWidget {
  const SCheckBoxInnerCircle({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDarkMode();

    return Container(
      height: 20,
      width: 20,
      padding: EdgeInsets.all(SSizes.xs),
      decoration: BoxDecoration(
        border:Border.all(
          color: isActive ? SAppColors.error : (dark ? SAppColors.dark.white : SAppColors.light.black),
          width: 2
        ),
        borderRadius: BorderRadius.circular(SSizes.all)
      ),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? SAppColors.error : Colors.transparent,
          borderRadius: BorderRadius.circular(SSizes.all)
        ),
      ),
    );
  }
}