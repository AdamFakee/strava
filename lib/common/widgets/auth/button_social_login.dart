import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:strava/utils/const/sizes.dart';

/// button with title & svg Icon
/// 
/// [iconAsset] have to a "SVG" image
class SButtonSocialLogin extends StatelessWidget {
  const SButtonSocialLogin({
    super.key,
    required this.iconAsset,
    required this.title,
    required this.sematicLabel,
    required this.onPressed,
  });

  final String iconAsset;
  final String sematicLabel;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        spacing: SSizes.md,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconAsset,
            semanticsLabel: sematicLabel,
            width: 30,
            height: 30,
          ),
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    );
  }
}
