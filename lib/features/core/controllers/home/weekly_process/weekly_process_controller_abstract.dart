// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:strava/features/core/models/weekly_activity_model.dart';


abstract class SWeeklyProcessControllerAbstract {
  Future<List<SWeeklyActivityModel>> getPreviousAndCurrentWeekly(BuildContext context);
}
