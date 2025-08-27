import 'package:flutter/material.dart';
import 'package:strava/common/widgets/loading_indicators/circular/circular_loading_indicator.dart';

/// display loading inside button
class SCircularLoadingInsideButton extends StatelessWidget {
  const SCircularLoadingInsideButton({
    super.key,
    this.width = 22,
    this.height = 22,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: SCircularLoadingIndicator()
    );
  }
}
