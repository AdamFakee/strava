import 'package:strava/utils/extensions/date_time_extensions.dart';

class SWeeklyActivityModel {
  String? id; // current week + current year
  final int totalTimer;
  final double totalDistance;
  final int totalActivities;
  final String userId;

  SWeeklyActivityModel({
    required this.totalTimer, 
    required this.totalDistance, 
    this.totalActivities = 1, 
    String? id, 
    required this.userId
  }) : id = id ?? generateId();

  factory SWeeklyActivityModel.empty({String? id}) => SWeeklyActivityModel(totalTimer: 0, totalDistance: 0, userId: "", id: id ?? generateId(), totalActivities: 0);

  static String generateId ({
    int? givenWeek,
    int? givenYear,
    bool isPreviousWeek = false
  }) {
    final now = DateTime.now();
    final currentYear = givenYear ?? now.year;
    final currentWeek = givenWeek ?? (isPreviousWeek ? now.weekNumber(now) - 1 : now.weekNumber(now));
    
    
    return '$currentWeek$currentYear';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': generateId(),
      'totalTimer': totalTimer,
      'totalDistance': totalDistance,
      'totalActivities': totalActivities,
      'userId': userId
    };
  }

  factory SWeeklyActivityModel.fromMap(Map<String, dynamic> map) {
    return SWeeklyActivityModel(
      id: map['id'].toString(),
      totalTimer: map['totalTimer'],
      totalDistance: map['totalDistance'],
      totalActivities: map['totalActivities'],
      userId: map['userId']
    );
  }


}
