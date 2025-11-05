import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/extensions/context_extensions.dart';

class SProgressWeeklyVertical extends StatelessWidget {
  const SProgressWeeklyVertical({
    super.key, required this.title, required this.currentWeekValue, required this.previousWeekValue,
  });

  final String title;
  final double currentWeekValue;
  final double previousWeekValue;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDarkMode();

    double increaPercent = 0;
    double valueChange = (currentWeekValue - previousWeekValue);

    if(valueChange < 0) {
      increaPercent = 1 - (valueChange.abs() / previousWeekValue);
    } else if (increaPercent > 0) {
      increaPercent = (valueChange / previousWeekValue);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Text(
          currentWeekValue.toStringAsFixed(1), 
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        // number of increation
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 2
          ),
          decoration: BoxDecoration(
            color: dark ? SAppColors.black : SAppColors.dark.grayDark.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(SSizes.sm / 2)),
          ),
          child: Row(
            children: [
              Icon(
                valueChange >= 0 ? Iconsax.arrow_up_1 : Iconsax.arrow_down,
                color: valueChange >= 0 ? Colors.green : Colors.red,
              ),
              Text('${increaPercent.toStringAsFixed(1)}%')
            ],
          ),
        )
      ],
    );
  }
}
