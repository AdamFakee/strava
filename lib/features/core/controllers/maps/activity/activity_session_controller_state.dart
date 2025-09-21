// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:strava/data/repos/activity/activity_repos.dart';
import 'package:strava/data/repos/weekly_activity/weekly_activity_repos.dart';
import 'package:strava/features/core/controllers/maps/activity/activity_session_controller_abtract.dart';
import 'package:strava/features/core/controllers/maps/distance/distance_controller_provider.dart';
import 'package:strava/features/core/controllers/maps/map/map_controller_provider.dart';
import 'package:strava/features/core/controllers/maps/screen_shot/screen_shot_controller_provider.dart';
import 'package:strava/features/core/controllers/maps/timer/timer_controller_provider.dart';
import 'package:strava/features/core/models/activity_model.dart';
import 'package:strava/features/core/models/weekly_activity_model.dart';
import 'package:strava/utils/const/message_errors.dart';
import 'package:strava/utils/exceptions/handle_exception/handle_controller_exeption.dart';
import 'package:strava/utils/helpers/file_system.dart';
import 'package:strava/utils/helpers/generate_helpers.dart';
import 'package:strava/utils/helpers/helper_function.dart';
import 'package:strava/utils/popups/confirm_popup.dart';
import 'package:strava/utils/popups/fullscreen_loader.dart';
import 'package:strava/utils/popups/snackbar.dart';
import 'package:strava/utils/routers/app_router_names.dart';

class SActivitySessionControllerState extends Notifier<SActivitySessionControllerStateType> implements ActivitySessionControllerAbtract {
  // variable
  final _user = FirebaseAuth.instance.currentUser!;
  final _activityRepos = SActivityRepos();
  final _weeklyActivityRepos = SWeeklyActivityRepos();

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

  Future<void> _stop(BuildContext context) async {
    return await SHandleControllerExeption(context, () async {
      // show loading
      SFullscreenLoader.show(context);

      // các kết quả tính toán được
      final routePoints = ref.read(SMapControllerProvider).routePoints;
      final distance = ref.read(SDistanceControllerProvider).distance;
      final timer = ref.read(STimerControllerProvider).time;
      
      // // dừng mọi state liên quan đến việc theo dõi và tính toán người dùng khi di chuyển
      // ref.read(SMapControllerProvider.notifier).stop(); 
      // ref.read(STimerControllerProvider.notifier).stop(); 
      // ref.read(SDistanceControllerProvider.notifier).stop(); 

      if(routePoints.isEmpty || distance < 0.03) {
        // stop loading
        SFullscreenLoader.stop(context);

        // show alert
        return SSnackbar.show(context, type: SSnackbarEnum.warning, message: "Vui lòng di chuyển trước khi dừng. Thông tin của bạn sẽ không được lưu lại.");
      }

      ref.read(SMapControllerProvider.notifier).moveToLatLngBounds();

      // delay 2s để gg map render xong
      await Future.delayed(Duration(seconds: 2));

      // chụp ảnh màn hình
      final imageUint8 = await ref.read(SScreenShotControllerProvider).screenShotGoogleMap();

      if(imageUint8 == null || imageUint8.isEmpty) {
        // stop loading
        SFullscreenLoader.stop(context);

        // show alert
        return SSnackbar.show(context, type: SSnackbarEnum.error, message: "Có lỗi khi lưu lại thông tin cho hoạt động của bạn");
      } 

      // -----------------------------------------
      // phần [ghi ra file tạm] để đó sau check

      // 2. Ghi ra file tạm
      final tempDir = await getTemporaryDirectory();
      final tempPath = "${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png";
      final tempFile = await File(tempPath).writeAsBytes(imageUint8);

      // cắt ảnh
      final imageCropt = await SHelperFunction.cropMiddlePart(tempFile);

      // lưu vào file system
      final fileName = _user.uid + SGenerateHelpers.getRandomString();
      final imageFile = await SFileSystem.writeAsBytes(imageCropt, fileName: fileName);

      // lưu vào db
      final activity = SActivityModel(
        imagePath: imageFile.path,
        timer: timer.toString(), 
        pace: SHelperFunction.calculateRunningPace(distance, timer), 
        distance: distance.toString(), 
        status: true,
        routePoints: jsonEncode(routePoints), 
        userId: _user.uid
      );

      // lưu weekly_activity
      final weeklyActivity = SWeeklyActivityModel(
        totalTimer: timer, 
        totalDistance: distance,
        userId: _user.uid,
      );
      
      // save and handle err or success
      final status = await _activityRepos.createActivity(activity);

      final statusWeekly = await _weeklyActivityRepos.createOrUpdateWeeklyActivity(weeklyActivity);

      // stop loading
      SFullscreenLoader.stop(context);

      if(status == false && statusWeekly == false && context.mounted) {
        SSnackbar.show(context, type: SSnackbarEnum.warning, message: SMessageErrors.createActivityError);
      } else {
        context.replace(SAppRouterNames.homeTab);
      }

      return;

    }).whenComplete(() {
      // dừng mọi state liên quan đến việc theo dõi và tính toán người dùng khi di chuyển
      ref.read(SMapControllerProvider.notifier).stop(); 
      ref.read(STimerControllerProvider.notifier).stop(); 
      ref.read(SDistanceControllerProvider.notifier).stop(); 
    });
  }
}