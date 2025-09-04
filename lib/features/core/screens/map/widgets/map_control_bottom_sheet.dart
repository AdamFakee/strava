import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:strava/common/widgets/buttons/button_icon_text_vertical.dart';
import 'package:strava/features/core/controllers/maps/activity/activity_session_controller_provider.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/icon_strings.dart';
import 'package:strava/utils/const/sizes.dart';

/// widget gồm các button để điều khiển người dùng bắt đầu chạy, chọn cách di chuyển, thêm route
class SMapControlBottomSheet extends ConsumerWidget {
  const SMapControlBottomSheet({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final activityProvider = ref.read(SActivitySessionControllerProvider.notifier);
    final activityState = ref.watch(SActivitySessionControllerProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: SSizes.defaultSpace * 1.4,
        vertical: SSizes.md
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// chọn kiểu di chuyển
          SButtonIconTextVertical(
            buttonTitle: 'Running',
            icon: SIconStrings.runningShoeSvg,
          ),

          // bắt đầu di chuyển / dừng di chuyển
          Transform.translate(
            offset: Offset(0, -SSizes.sm),
            child: SButtonIconTextVertical(
              icon: activityState.start ? Iconsax.pause : Iconsax.play,
              padding: EdgeInsets.all(SSizes.md * 1.2),
              bgColor: SAppColors.primary,
              onPress: () {
                activityProvider.toggleActivity(context);
              },
            ),
          ),

          // button thêm route
          SButtonIconTextVertical(
            buttonTitle: 'Add Route',
            icon: SIconStrings.addRouteSvg,
          ),
        ],
      ),
    );
  }
}
