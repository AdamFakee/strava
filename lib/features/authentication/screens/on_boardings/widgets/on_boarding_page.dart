import 'package:flutter/material.dart';
import 'package:strava/utils/const/image_strings.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/extensions/context_extensions.dart';

class SOnBoardingPage extends StatelessWidget {
  const SOnBoardingPage({super.key, required this.image, required this.title});

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: SSizes.defaultSpace),
      child: Column(
        spacing: SSizes.spaceBtwItems * 1.5,
        children: [
          // logo
          Image.asset(
            SImageStrings.strava_logo_text,
            width: 140,
            height: 60,
            color: Colors.white,
          ),

          // image
          Container(
            width: context.screenWidht() * 0.7,
            height: context.screenHeight() * 0.6,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(SSizes.md)
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),

          // title
          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge!.apply(fontSizeDelta: 4),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
