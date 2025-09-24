import 'package:flutter/material.dart';

class SVerticalStatText extends StatelessWidget {
  const SVerticalStatText({
    super.key, required this.title, required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Text(subTitle, style: Theme.of(context).textTheme.bodyMedium!.apply(
          color: Colors.white,
          fontWeightDelta: 2,
          fontSizeDelta: 2
        ),)
      ],
    );
  }
}