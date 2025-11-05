// Widget này có thể tái sử dụng để hiển thị các chỉ số như Quãng đường, Thời gian và so sánh với tuần trước.

import 'package:flutter/material.dart';
import 'package:strava/utils/extensions/time_extensions.dart';

class ComparisonStatWidget extends StatelessWidget {
  final String title;
  final String mainValue;
  final double currentValue;
  final double previousValue;
  final String unit;

  const ComparisonStatWidget({
    super.key,
    required this.title,
    required this.mainValue,
    required this.currentValue,
    required this.previousValue,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final diff = currentValue - previousValue;
    final Color diffColor = diff.isNegative ? Colors.red : Colors.green;
    final String sign = diff.isNegative ? '' : '+';
    
    final bool showComparison = previousValue > 0.01; // Hiển thị nếu tuần trước có hoạt động

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.bodySmall),
        const SizedBox(height: 4),
        Text(mainValue, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 4),
        if (showComparison)
          if (unit == 'mins')
            Text(
              '$sign${diff.toInt().toFormattedString()} $unit vs last week',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: diffColor),
            )
          else 
            Text(
              '$sign${diff.toStringAsFixed(2)} $unit vs last week',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: diffColor),
            )
        else
          Text(
            'No data last week',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
      ],
    );
  }
}