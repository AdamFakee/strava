import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SSettingFeature extends StatelessWidget {
  const SSettingFeature({
    super.key, 
    required this.title, 
    this.onPress,
    required this.icon
  });

  final String title;
  final VoidCallback? onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: onPress != null ? Icon(Iconsax.arrow_right_1) : null,
      onTap: onPress,
    );
  }
}