import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';


class SHomeBarSummarySectionTitle extends StatelessWidget {
  const SHomeBarSummarySectionTitle({
    super.key, 
    required this.title, 
    required this.buttonTitlte, 
    required this.onPressed,
  });

  final String title;
  final String buttonTitlte;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.apply(fontWeightDelta: 20),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonTitlte,
            style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: SAppColors.primary,
              fontWeightDelta: 20,
            ),
          ),
        ),
      ],
    );
  }
}
