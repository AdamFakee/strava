import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';

class SLanguageCard extends StatelessWidget {
  const SLanguageCard({
    super.key,
    required this.title, 
    required this.imageString,
    required this.isActive,
    this.onPress
  });

  final String title;
  final String imageString;
  final bool isActive;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(SSizes.md),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SSizes.md),
          border: Border.all(
            color: isActive ?SAppColors.primary : Colors.grey,
          ),
          color: isActive ?SAppColors.primary.withOpacity(0.1) : Colors.transparent
        ),
        child: Row(
          spacing: SSizes.sm,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(SSizes.all),
              child: Image.asset(
                imageString,
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
      
            const Spacer(),
            if(isActive)
              Checkbox(
                value: true, 
                onChanged: (value) {},
                checkColor: SAppColors.primary,
                activeColor: SAppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(SSizes.all)
                ),
              )
          ],
        ),
      ),
    );
  }
}