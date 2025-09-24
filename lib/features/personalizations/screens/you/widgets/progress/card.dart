import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';

class SCard extends StatelessWidget {
  const SCard({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: SSizes.xs / 2
      ),
      decoration: BoxDecoration(
        color: SAppColors.black
      ),
      padding: EdgeInsets.all(SSizes.md),
      child: child,
    );
  }
}