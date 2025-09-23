// ignore: file_names
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';


class SEmptyData extends StatelessWidget {
  const SEmptyData({
    super.key, required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Iconsax.emoji_sad),
        Text(
          title, 
          style: Theme.of(context).textTheme.bodyLarge!.apply(
            fontWeightDelta: 2
          ),
        )
      ],
    );
  }
}