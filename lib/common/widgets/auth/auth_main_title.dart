import 'package:flutter/material.dart';

class SAuthMainTitle extends StatelessWidget {
  const SAuthMainTitle({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(
        context,
      ).textTheme.headlineLarge!.apply(fontWeightDelta: 2),
    );
  }
}