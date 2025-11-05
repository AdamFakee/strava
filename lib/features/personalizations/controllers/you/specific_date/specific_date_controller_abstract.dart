// --- BẠN CÓ THỂ ĐẶT 2 CLASS DƯỚI ĐÂY VÀO FILE RIÊNG ---
// Ví dụ: specific_date_controller_state_type.dart

import 'package:strava/utils/extensions/date_time_extensions.dart';

abstract class SSpecificDateControllerAbstract {
  void changeDay (DateTime day);
  void changeNumWeek (int negativeWeek);
  String giveNumWeekString ();
  void nextWeek(); // Thêm vào abstract class
  void previousWeek(); // Thêm vào abstract class
}

class SSpecificDateControllerStateType {
  final int numWeek;
  final DateTime day;

  SSpecificDateControllerStateType({
    required this.numWeek, required this.day,
  });

  factory SSpecificDateControllerStateType.init() {
    final now = DateTime.now();
    final week = now.weekNumber(now);
    return SSpecificDateControllerStateType(
      numWeek: week,
      day: now
    );
  }

  SSpecificDateControllerStateType copyWith({
    int? numWeek,
    DateTime? day,
  }) {
    return SSpecificDateControllerStateType(
      numWeek: numWeek ?? this.numWeek,
      day: day ?? this.day,
    );
  }
}
// --- KẾT THÚC PHẦN STATE ---