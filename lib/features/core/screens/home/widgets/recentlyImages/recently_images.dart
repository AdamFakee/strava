import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/common/widgets/circular_indicator_horizontal.dart';
import 'package:strava/common/widgets/emptyData.dart';
import 'package:strava/common/widgets/loading_indicators/circular/circular_loading_indicator.dart';
import 'package:strava/features/core/controllers/home/indicator/indicator_controller_provider.dart';
import 'package:strava/features/core/controllers/home/recentlyImages/recently_images_controller.dart';
import 'package:strava/features/core/screens/home/widgets/banner/home_bar_summaries_heading_title.dart';
import 'package:strava/features/core/screens/home/widgets/recentlyImages/detail_activity_dialog.dart';
import 'package:strava/l10n/app_localizations.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/extensions/context_extensions.dart';

class SRecentlyImages extends ConsumerWidget {
  const SRecentlyImages({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final controller = SRecentlyImagesController();
    final recentlyImagesIndicatorProvider = ref.read(SRecentlyImagesSlideIndicatorControllerProvider.notifier);

    return SizedBox(
      height: context.screenHeight() * 0.7,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SSizes.md
            ),
            child: SHomeBarSummarySectionTitle(
              title: SAppLanguages.of(context)!.recentActivities, 
              buttonTitlte: "", 
              onPressed: () => {}
            ),
          ),

          // images & indicator
          Expanded(
            child: FutureBuilder(
              future: controller.getRecentlyActivities(), 
              builder:(context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return SCircularLoadingIndicator();
                }

                if(snapshot.data == null || snapshot.data!.isEmpty) {
                  return SEmptyData(
                    title: SAppLanguages.of(context)!.noRecentActivities,
                  );
                }

                final data = snapshot.data;
                final numOfPages = data?.length ?? 0;
                return Column(
                  spacing: SSizes.md,
                  children: [
                    // image slider
                    CarouselSlider(
                      options: CarouselOptions(
                        height: context.screenHeight() * 0.6,
                        viewportFraction: 0.75,
                        enlargeFactor: 1,
                        onPageChanged: (idx, _) {
                          recentlyImagesIndicatorProvider.move(idx, numOfPages);
                        },
                      ),
                      items: data?.map((e) {
                        return GestureDetector(
                          onTap: () {
                            SDetailActivityDialog.show(context, e);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(SSizes.md),
                            child: SizedBox(
                              // width: context.screenWidht() * 0.7,
                              height: context.screenHeight(),
                              child: Image.file(
                                File(e.imagePath), 
                                fit: BoxFit.cover,
                              )
                            ),
                          ),
                        );
                      }).toList(), 
                    ),

                    // indicator
                    Consumer(
                      builder: (context, ref, child) {
                        final currentIdxPage = ref
                            .watch(SRecentlyImagesSlideIndicatorControllerProvider)
                            .currentIdxPage;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: SSizes.md),
                            child: CircularIndicatorHorizontal(
                              currentIdxPage: currentIdxPage,
                              numberOfPage: numOfPages
                            ),
                        );
                      },
                    ),
                  ],
                );
              },
            )
          )
        ],
      )
    );
  }
}
