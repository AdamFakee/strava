import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/utils/themes/states/theme_mode_provider.dart';

class SHomeScreen extends ConsumerWidget{
  const SHomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      body: SizedBox(
        height: 200,
        width: 300,
        child: ElevatedButton(onPressed: () {
          ref.read(sThemeModeProvider.notifier).toggleTheme();
        }, child: Text("sss"))
      ),
    );
  }
}