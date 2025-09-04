import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/controllers/maps/map/map_controller_state.dart';
import 'package:strava/features/core/controllers/maps/map/map_controller_state_abtract.dart';

// ignore: non_constant_identifier_names
final SMapControllerProvider = NotifierProvider<SMapControllerState, SMapControllerStateType>(SMapControllerState.new); 