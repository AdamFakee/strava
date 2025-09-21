import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/controllers/home/indicator/indicator_controller_abstract.dart';

class SIndicatorControllerState extends Notifier<SIndicatorControllerStateType> implements SIndicatorControllerAbstract {
  @override
  SIndicatorControllerStateType build() {
    return SIndicatorControllerStateType.init();
  }

  @override
  void move(int idx, int numberOfPages) {
    state = state.copyWith(currentIdxPage: idx % numberOfPages);
  }
}