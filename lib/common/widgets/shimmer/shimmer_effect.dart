import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:strava/utils/extensions/context_extensions.dart';

class SShimmerEffect extends StatelessWidget {
  const SShimmerEffect({
    super.key,
    this.width,
    this.height,
    this.radius = 15,
    this.margin
  });

  // variables
  final double? width, height;
  final double radius;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = context.isDarkMode();
    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey[850]! : Colors.grey[350]!,
      highlightColor: isDarkMode ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        margin: margin,
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: isDarkMode ? Color(0xFFF4F4F4) : Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
