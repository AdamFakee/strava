import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/controllers/maps/screen_shot/screen_shot_controller.dart';

// ignore: non_constant_identifier_names
final SScreenShotControllerProvider = Provider((ref) {
  return SScreenShotController();
});