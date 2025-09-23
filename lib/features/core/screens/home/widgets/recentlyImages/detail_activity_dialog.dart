import 'dart:io';

import 'package:flutter/material.dart';
import 'package:strava/common/widgets/texts/text_with_value_vertical.dart';
import 'package:strava/features/core/models/activity_model.dart';
import 'package:strava/l10n/app_localizations.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/helpers/format_helpers.dart';

class SDetailActivityDialog {
  static void show(BuildContext context, SActivityModel activity) {
    showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(SSizes.defaultSpace),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Hình ảnh
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        File(activity.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Box chứa thông số
                    Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.orange, width: 1.5),
                      ),
                      child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        runAlignment: WrapAlignment.center,
                        runSpacing: SSizes.lg,
                        children: [
                          STextWithValueVertical(
                            title: SAppLanguages.of(ctx)!.time,
                            value: SFormatHelpers.secondToTimeClock(
                              int.parse(activity.timer),
                            ),
                          ),
                          STextWithValueVertical(
                            title: "Pace (km/h)",
                            value: activity.pace,
                          ),
                          STextWithValueVertical(
                            title: SAppLanguages.of(ctx)!.distance,
                            value: double.parse(activity.distance).toStringAsFixed(1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                right: 8,
                top: 8,
                child: GestureDetector(
                  onTap: () => Navigator.of(ctx).pop(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
