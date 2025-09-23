import 'package:flutter/material.dart';
import 'package:strava/utils/const/sizes.dart';

class STabBar extends StatelessWidget {
  const STabBar({
    super.key, 
    required this.title, 
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SSizes.sm
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}