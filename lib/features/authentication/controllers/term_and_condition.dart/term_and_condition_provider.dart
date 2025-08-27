import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/authentication/controllers/term_and_condition.dart/term_and_condition_abstract.dart';
import 'package:strava/features/authentication/controllers/term_and_condition.dart/term_and_condition_state.dart';

// ignore: non_constant_identifier_names
final STermAndConditionProvider = NotifierProvider<STermAndConditionState, STermAndConditionStateType>(STermAndConditionState.new);