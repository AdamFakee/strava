import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/controllers/maps/activity/activity_session_controller_abtract.dart';
import 'package:strava/features/core/controllers/maps/activity/activity_session_controller_state.dart';

// ignore: non_constant_identifier_names
final SActivitySessionControllerProvider = NotifierProvider<SActivitySessionControllerState, SActivitySessionControllerStateType> (SActivitySessionControllerState.new);