import 'package:flutter/material.dart';
import 'package:strava/features/personalizations/screens/settings/widgets/themes/check_box_inner_circle.dart';
import 'package:strava/utils/const/sizes.dart';

class SThemeModeCard extends StatelessWidget {
  const SThemeModeCard({
    super.key,
    required this.title,
    required this.isActive,
    required this.onPress,
    required this.imageString
  });

  final String title;
  final bool isActive;
  final String imageString;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Row(
        spacing: SSizes.md,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(SSizes.md),
            child: Image.asset(
              imageString, 
              height: 130,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          Text(title, style: Theme.of(context).textTheme.bodyMedium),
      
          const Spacer(),
      
          SCheckBoxInnerCircle(isActive: isActive),
        ],
      ),
    );
  }
}
