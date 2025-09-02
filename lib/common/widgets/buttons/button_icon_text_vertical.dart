import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/helpers/detect_icon_type.dart';

class SButtonIconTextVertical extends StatelessWidget {
  const SButtonIconTextVertical({
    super.key,
    required this.icon,
    this.buttonTitle = "",
    this.onPress,
    this.iconColor = Colors.white,
    this.bgColor = Colors.grey,
    this.padding = const EdgeInsets.all(SSizes.md),
    this.iconSize = SSizes.iconLg,
  });

  final dynamic icon;
  final String buttonTitle;
  final VoidCallback? onPress;
  final Color iconColor;
  final Color bgColor;
  final EdgeInsets padding;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final type = detectIconType(icon);

    late final Widget iconWidget;
    switch (type) {
      case SIconType.iconData:
        iconWidget = Icon(icon, size: iconSize, color: iconColor);
        break;
      case SIconType.generalImage:
        iconWidget = Image.asset(icon, width: iconSize, height: iconSize);
        break;
      case SIconType.svg:
        iconWidget = SvgPicture.asset(
          icon,
          width: iconSize,
          height: iconSize,
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
        );
        break;
      case SIconType.unknown:
        assert(false, "type of icon must be IconData, .svg, or general image (.png, ...)");
        // iconWidget = const SizedBox(); 
        break;
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onPress,
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(SSizes.all),
            ),
            child: Center(child: iconWidget),
          ),
        ),
        if (buttonTitle.isNotEmpty) ...[
          const SizedBox(height: 6),
          Text(buttonTitle),
        ],
      ],
    );
  }
}
