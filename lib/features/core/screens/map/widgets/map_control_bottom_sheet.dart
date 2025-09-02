import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:strava/common/widgets/buttons/button_icon_text_vertical.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/icon_strings.dart';
import 'package:strava/utils/const/sizes.dart';

class SMapControlBottomSheet extends StatelessWidget {
  const SMapControlBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SSizes.defaultSpace * 1.4,
        vertical: SSizes.md
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SButtonIconTextVertical(
            buttonTitle: 'Running',
            icon: SIconStrings.runningShoeSvg,
          ),
          Transform.translate(
            offset: Offset(0, -SSizes.sm),
            child: SButtonIconTextVertical(
              icon: Iconsax.play,
              padding: EdgeInsets.all(SSizes.md * 1.2),
              bgColor: SAppColors.primary,
            ),
          ),
          SButtonIconTextVertical(
            buttonTitle: 'Add Route',
            icon: SIconStrings.addRouteSvg,
          ),
        ],
      ),
    );
  }
}
