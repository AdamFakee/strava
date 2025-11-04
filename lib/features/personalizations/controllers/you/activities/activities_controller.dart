import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:strava/data/repos/activity/activity_repos.dart';
import 'package:strava/features/core/models/weekly_activity_model.dart';
import 'package:strava/features/personalizations/controllers/you/activities/activities_controller_state_type.dart';
import 'package:strava/utils/extensions/date_time_extensions.dart';

/// cách sử dụng: trước khi khởi tạo class => lấy value cũ để xử lý giá trị [_goalPreferenceKey] => rồi mới hiển thị
class YourActivitiesController extends Notifier<YourActivitiesState> {
  // Key để lưu mục tiêu vào SharedPreferences
  static const String _goalPreferenceKey = 'weekly_goal_km';
  
  // Lấy repository thông qua dependency injection của Riverpod
  late final SActivityRepos _activityRepos;

  @override
  YourActivitiesState build() {
    _activityRepos = SActivityRepos(); // Khởi tạo repo
    _init(); // Gọi hàm khởi tạo để nạp dữ liệu
    return YourActivitiesState(); // Trả về state ban đầu
  }

  Future<void> _init() async {
    // Nạp mục tiêu đã lưu
    final prefs = await SharedPreferences.getInstance();
    final savedGoal = prefs.getDouble(_goalPreferenceKey) ?? 20.0; // Mặc định là 20km

    state = state.copyWith(weeklyGoalKm: savedGoal);
    
    // Nạp dữ liệu hoạt động
    await _fetchActivities();
  }

  Future<void> _fetchActivities() async {
    state = state.copyWith(
      weeklyProgress: const AsyncValue.loading(),
      recentActivities: const AsyncValue.loading(),
    );

    try {
      final currentWeekNumber = DateTime.now().weekNumber(DateTime.now());
      
      // Lấy dữ liệu tuần này
      final weeklyActivities = await _activityRepos.getRowsInGivenWeek(currentWeekNumber);
      double totalDistance = 0;
      int totalTime = 0;
      for (var activity in weeklyActivities) {
        totalDistance += double.tryParse(activity.distance) ?? 0.0;
        totalTime += int.tryParse(activity.timer) ?? 0;
      }
      
      final weeklyModel = SWeeklyActivityModel(
        totalTimer: totalTime, 
        totalDistance: totalDistance, 
        totalActivities: weeklyActivities.length,
        userId: '' // Thêm userId nếu cần
      );
      
      // Lấy 10 hoạt động gần nhất
      final recentActivities = await _activityRepos.getTopRowsByGivenNumber(10);
      
      state = state.copyWith(
        weeklyProgress: AsyncValue.data(weeklyModel),
        recentActivities: AsyncValue.data(recentActivities),
      );

    } catch (e, stack) {
      state = state.copyWith(
        weeklyProgress: AsyncValue.error(e, stack),
        recentActivities: AsyncValue.error(e, stack),
      );
    }
  }

  Future<void> setWeeklyGoal(double newGoal) async {
    if (newGoal <= 0) return;
    
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(_goalPreferenceKey, newGoal);
    
    state = state.copyWith(weeklyGoalKm: newGoal);
  }

  // Cung cấp hàm refresh để dùng với Pull-to-refresh
  Future<void> refresh() async {
    await _fetchActivities();
  }
}
