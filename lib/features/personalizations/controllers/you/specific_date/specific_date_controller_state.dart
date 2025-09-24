import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/personalizations/controllers/you/specific_date/specific_date_controller_abstract.dart';
import 'package:strava/utils/extensions/date_time_extensions.dart';

class SSpecificDateControllerState extends Notifier<SSpecificDateControllerStateType> implements SSpecificDateControllerAbstract{
  @override
  SSpecificDateControllerStateType build() {
    return SSpecificDateControllerStateType.init();
  }

  @override
  String giveNumWeekString() {
    final now = DateTime.now();
    final week = now.weekNumber(now);

    if(state.numWeek == week) {
      return "This week";
    }

    return "${state.numWeek} weeks";
  }
  
  @override
  void changeDay(DateTime day) {
    state = state.copyWith(day: day);
  }
  
  @override
  void changeNumWeek(int negativeWeek) {
    final now = DateTime.now();
    final week = now.weekNumber(now);
    state = state.copyWith(
      numWeek: week - negativeWeek
    );
  }
}