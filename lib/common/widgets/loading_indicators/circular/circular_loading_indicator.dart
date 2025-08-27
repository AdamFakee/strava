import 'package:flutter/material.dart';
import 'package:strava/utils/const/colors.dart';

/// custom circular loading
class SCircularLoadingIndicator extends StatelessWidget {
  const SCircularLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: SAppColors.primary,
      strokeWidth: 3,
    );
  }

}