import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/extensions/context_extensions.dart';


/// A class show confirm popup (dialog)
class SConfirmPopup {
  /// Function onpen or show popup
  /// 
  /// When tap in "barrier area" return false
  static Future<bool> show({
    String title = "Are you sure?",
    String? content,
    String textConfirm = "Yes",
    String textCancel = "No",
    required BuildContext context,
  }) async {
    return await showDialog(
      context: context,
      builder: (context) {
        final bool isDarkMode = context.isDarkMode();
        return AlertDialog(
          backgroundColor: isDarkMode ? SAppColors.dark.black
           : SAppColors.light.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(SSizes.sm)
          ),
          // mặc định là 8px
          actionsPadding: EdgeInsets.only(left: SSizes.lg, right: SSizes.lg, top: 0, bottom: SSizes.lg),
          // mặc định là 24px
          contentPadding: EdgeInsetsGeometry.symmetric(
            horizontal: SSizes.lg,
            vertical: SSizes.sm
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          content: content != null ? Text(content, style: Theme.of(context).textTheme.labelMedium,) : null,
          actions: [
            Row(
              spacing: SSizes.md,
              children: [
                // button confirm
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      close(true, context);
                    },
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: SSizes.sm,
                        horizontal: SSizes.md,
                      ),
                    ),
                    child: Text(textConfirm, style: Theme.of(context).textTheme.bodyMedium!.apply(
                      color: isDarkMode ? SAppColors.dark.white : SAppColors.light.black
                    ),),
                  ),
                ),

                // button cancle
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      close(false, context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                        vertical: SSizes.sm,
                        horizontal: SSizes.md,
                      ),
                    ),
                    child: Text(textCancel,),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    ) ?? false;
  }

  /// Function close popup and return [value]
  static void close(bool value, BuildContext context) => Navigator.of(context).pop(value);
}
