import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/personalizations/controllers/you/specific_date/specific_date_controller_abstract.dart';
import 'package:strava/features/personalizations/controllers/you/specific_date/specific_date_controller_state.dart';

// ignore: non_constant_identifier_names
final SSpecificDateControllerProvider = NotifierProvider<SSpecificDateControllerState, SSpecificDateControllerStateType>(SSpecificDateControllerState.new);