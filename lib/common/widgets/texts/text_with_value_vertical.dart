import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';

class STextWithValueVertical extends StatelessWidget {
  const STextWithValueVertical({
    super.key, required this.title, required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(value.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(
          color: SAppColors.dark.white
        ),),
        Text(title, style: Theme.of(context).textTheme.bodySmall!.apply(
          color: SAppColors.dark.whiteDark
        ),),
      ],
    );
  }
}

