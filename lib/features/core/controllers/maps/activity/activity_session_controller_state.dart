import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/data/repos/activity/activity_repos.dart';
import 'package:strava/features/core/controllers/maps/activity/activity_session_controller_abtract.dart';
import 'package:strava/features/core/controllers/maps/distance/distance_controller_provider.dart';
import 'package:strava/features/core/controllers/maps/map/map_controller_provider.dart';
import 'package:strava/features/core/controllers/maps/timer/timer_controller_provider.dart';
import 'package:strava/features/core/models/activity_model.dart';
import 'package:strava/utils/const/message_errors.dart';
import 'package:strava/utils/exceptions/handle_exception/handle_controller_exeption.dart';
import 'package:strava/utils/helpers/helper_function.dart';
import 'package:strava/utils/popups/confirm_popup.dart';
import 'package:strava/utils/popups/snackbar.dart';

class SActivitySessionControllerState extends Notifier<SActivitySessionControllerStateType> implements ActivitySessionControllerAbtract {
  // variable
  final _user = FirebaseAuth.instance.currentUser!;
  final _activityRepos = SActivityRepos();

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
    
    if(context.mounted) {
      state.start ? _stop(context) : _start();
      state = state.copyWith(start: !state.start);
    }
  }

  /// chạy các hàm cần thiết khi người dùng bắt đầu chạy bộ
  void _start() {
    ref.read(SMapControllerProvider.notifier).start(); 
    ref.read(STimerControllerProvider.notifier).start(); 
    ref.read(SDistanceControllerProvider.notifier).start(); 
  }

  void _stop(BuildContext context) async {
    return await SHandleControllerExeption(context, () async {
      // các kết quả tính toán được
      final routePoints = ref.read(SMapControllerProvider).routePoints;
      final distance = ref.read(SDistanceControllerProvider).distance;
      final timer = ref.read(STimerControllerProvider).time;
      
      // dừng mọi state liên quan đến việc theo dõi và tính toán người dùng khi di chuyển
      ref.read(SMapControllerProvider.notifier).stop(); 
      ref.read(STimerControllerProvider.notifier).stop(); 
      ref.read(SDistanceControllerProvider.notifier).stop(); 

      // lưu vào db
      final activity = SActivityModel(
        timer: timer.toString(), 
        pace: SHelperFunction.calculateRunningPace(distance, timer), 
        distance: distance.toString(), 
        status: true,
        routePoints: jsonEncode(routePoints), 
        userId: _user.uid
      );
      
      // save and handle err or success
      final status = await _activityRepos.createActivity(activity);
      if(status == false && context.mounted) {
        SSnackbar.show(context, type: SSnackbarEnum.warning, message: SMessageErrors.createActivityError);
      }
    });
  }
}