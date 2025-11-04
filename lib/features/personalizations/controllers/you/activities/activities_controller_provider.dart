import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/personalizations/controllers/you/activities/activities_controller.dart';
import 'package:strava/features/personalizations/controllers/you/activities/activities_controller_state_type.dart';

// 3. Tạo Provider
final yourActivitiesControllerProvider = NotifierProvider<YourActivitiesController, YourActivitiesState>(
  YourActivitiesController.new,
);