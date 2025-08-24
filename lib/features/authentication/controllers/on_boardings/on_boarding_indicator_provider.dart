import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/authentication/controllers/on_boardings/on_boarding_indicator_state.dart';

final sOnBoardingIndicatorProvider = NotifierProvider<SOnBoardingIndicatorState, int>(SOnBoardingIndicatorState.new); 