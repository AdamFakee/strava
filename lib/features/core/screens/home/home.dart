import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/screens/home/widgets/banner/home_banner_summaries.dart';
import 'package:strava/utils/const/colors.dart';

class SHomeScreen extends ConsumerWidget {
  const SHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Xỏ giày vào đê",
          style: TextStyle(color: Colors.red),
        ),
        actions: [
          Icon(CupertinoIcons.chat_bubble_2,),
        ],
        backgroundColor: SAppColors.dark.grayDark.withAlpha(140),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            // banner for: summary result, suggest...
            SHomeBannerSumaries()
          ],
        ),
      ),
    );
  }
}

