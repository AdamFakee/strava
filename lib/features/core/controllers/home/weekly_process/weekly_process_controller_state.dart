import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:strava/data/repos/weekly_activity/weekly_activity_repos.dart';
import 'package:strava/features/core/controllers/home/weekly_process/weekly_process_controller_abstract.dart';
import 'package:strava/features/core/models/weekly_activity_model.dart';
import 'package:strava/utils/exceptions/handle_exception/handle_controller_exeption.dart';

class SWeeklyProcessController implements SWeeklyProcessControllerAbstract {

  final _weeklyActivitiesRepos = SWeeklyActivityRepos();
  
  @override
  Future<List<SWeeklyActivityModel>> getPreviousAndCurrentWeekly(BuildContext context) async {
  final result = await SHandleControllerExeption(context, () async {
    return await _weeklyActivitiesRepos.getPreviousAndCurrentWeeklyRow();
  });
  return result ?? [];
}


  



}