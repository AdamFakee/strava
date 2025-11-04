import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/features/core/models/activity_model.dart';
import 'package:strava/features/core/models/weekly_activity_model.dart';

class YourActivitiesState {
  // Mục tiêu người dùng đặt, ví dụ: 20.0 (km)
  final double weeklyGoalKm;
  // Dữ liệu hoạt động trong tuần, có thể đang loading, lỗi hoặc đã có data
  final AsyncValue<SWeeklyActivityModel> weeklyProgress;
  // Danh sách các hoạt động gần đây
  final AsyncValue<List<SActivityModel>> recentActivities;

  YourActivitiesState({
    this.weeklyGoalKm = 20.0, // Giá trị mặc định
    this.weeklyProgress = const AsyncValue.loading(),
    this.recentActivities = const AsyncValue.loading(),
  });

  YourActivitiesState copyWith({
    double? weeklyGoalKm,
    AsyncValue<SWeeklyActivityModel>? weeklyProgress,
    AsyncValue<List<SActivityModel>>? recentActivities,
  }) {
    return YourActivitiesState(
      weeklyGoalKm: weeklyGoalKm ?? this.weeklyGoalKm,
      weeklyProgress: weeklyProgress ?? this.weeklyProgress,
      recentActivities: recentActivities ?? this.recentActivities,
    );
  }
}