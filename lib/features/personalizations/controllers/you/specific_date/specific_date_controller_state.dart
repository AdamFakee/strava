import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/personalizations/controllers/you/specific_date/specific_date_controller_abstract.dart';
import 'package:strava/utils/extensions/date_time_extensions.dart';



class SSpecificDateControllerState extends Notifier<SSpecificDateControllerStateType> implements SSpecificDateControllerAbstract {
  
  @override
  SSpecificDateControllerStateType build() {
    return SSpecificDateControllerStateType.init();
  }

  @override
  void nextWeek() {
    final now = DateTime.now();
    final currentWeek = now.weekNumber(now);

    // Chỉ tăng nếu tuần đang chọn nhỏ hơn tuần hiện tại (không cho đi tới tương lai)
    if (state.numWeek < currentWeek) {
      state = state.copyWith(numWeek: state.numWeek + 1);
    }
  }

  @override
  void previousWeek() {
    // Không cho phép số tuần nhỏ hơn 1
    if (state.numWeek > 1) {
      state = state.copyWith(numWeek: state.numWeek - 1);
    }
  }

  @override
  String giveNumWeekString() {
    final now = DateTime.now();
    final currentWeek = now.weekNumber(now);

    if (state.numWeek == currentWeek) {
      return "This week";
    }
    
    if (state.numWeek == currentWeek - 1) {
      return "Last week";
    }

    return "Week ${state.numWeek}";
  }
  
  @override
  void changeDay(DateTime day) {
    state = state.copyWith(day: day);
  }
  
  @override
  void changeNumWeek(int negativeWeek) {
    final now = DateTime.now();
    final week = now.weekNumber(now);
    final targetWeek = week - negativeWeek;
    if (targetWeek > 0) { // Đảm bảo tuần hợp lệ
        state = state.copyWith(numWeek: targetWeek);
    }
  }
}