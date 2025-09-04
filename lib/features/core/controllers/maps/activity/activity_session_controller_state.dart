import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/controllers/maps/activity/activity_session_controller_abtract.dart';
import 'package:strava/features/core/controllers/maps/distance/distance_controller_provider.dart';
import 'package:strava/features/core/controllers/maps/map/map_controller_provider.dart';
import 'package:strava/features/core/controllers/maps/timer/timer_controller_provider.dart';
import 'package:strava/utils/popups/confirm_popup.dart';

class SActivitySessionControllerState extends Notifier<SActivitySessionControllerStateType> implements ActivitySessionControllerAbtract {
  @override
  SActivitySessionControllerStateType build() {
    return SActivitySessionControllerStateType.init();
  }

  @override
  void toggleActivity (BuildContext context) async {
    if(state.start) {
      final confirm = await SConfirmPopup.show(context: context,);
      if(confirm == false) return;
    }
    state.start ? _stop() : _start();
    state = state.copyWith(start: !state.start);
  }

  /// chạy các hàm cần thiết khi người dùng bắt đầu chạy bộ
  void _start() {
    ref.read(SMapControllerProvider.notifier).start(); 
    ref.read(STimerControllerProvider.notifier).start(); 
    ref.read(SDistanceControllerProvider.notifier).start(); 
  }

  /// ngược lại với hàm `_start`
  void _stop() {
    
    ref.read(SMapControllerProvider.notifier).stop(); 
    ref.read(STimerControllerProvider.notifier).stop(); 
    ref.read(SDistanceControllerProvider.notifier).stop(); 
  }


}