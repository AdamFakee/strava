import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/controllers/maps/timer/timer_controller_abstract.dart';

class STimerControllerState extends Notifier<STimerControllerStateType> implements STimerControllerAbstract{
  @override
  STimerControllerStateType build() {
    return STimerControllerStateType.init();
  }

  Timer? _timer;

  @override
  void start () {
    _timer = Timer.periodic(Duration(seconds: 1), (count) {
      state = state.copyWith(time: count.tick);
    });
  }

  @override
  void stop () {
    _timer?.cancel();
    _timer = null;
    state = state.copyWith(time: 0);
  }
}