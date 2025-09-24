// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:strava/utils/extensions/date_time_extensions.dart';

abstract class SSpecificDateControllerAbstract {
  void changeDay (DateTime day);
  void changeNumWeek (int negativeWeek);
  String giveNumWeekString ();
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
