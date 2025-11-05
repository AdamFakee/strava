import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/data/repos/activity/activity_repos.dart';
import 'package:strava/features/core/models/activity_model.dart';
import 'package:strava/features/personalizations/controllers/you/specific_date/specific_date_controller_provider.dart';

/// Model để chứa dữ liệu đã được xử lý cho UI
class ProgressData {
  final List<SActivityModel> currentWeekActivities;
  final double previousWeekDistance; // tính bằng mét
  final int previousWeekTime; // tính bằng giây

  ProgressData({
    required this.currentWeekActivities,
    this.previousWeekDistance = 0.0,
    this.previousWeekTime = 0,
  });
}

/// Controller sử dụng AsyncNotifier để quản lý state bất đồng bộ
class ProgressTabController extends AsyncNotifier<ProgressData> {
  
  @override
  Future<ProgressData> build() async {
    // Khởi tạo repo trong build để có thể truy cập ref
    final activityRepos = ref.read(activityReposProvider); // Giả định bạn có provider cho repo
    
    // Lắng nghe tuần được chọn. Khi thay đổi, provider sẽ tự build lại
    final selectedWeek = ref.watch(SSpecificDateControllerProvider.select((state) => state.numWeek));

    // Lấy dữ liệu đồng thời cho cả 2 tuần để tăng hiệu suất
    final results = await Future.wait([
      activityRepos.getRowsInGivenWeek(selectedWeek),
      if (selectedWeek > 1) activityRepos.getRowsInGivenWeek(selectedWeek - 1) else Future.value(<SActivityModel>[]),
    ]);

    

    final currentActivities = results[0];
    final previousActivities = results[1];

    print('x1::: ${currentActivities.length}');
    print('x::: ${previousActivities.length}');

    // Tính toán tổng số liệu của tuần trước
    double prevTotalDistance = 0;
    int prevTotalTime = 0;
    for (var activity in previousActivities) {
      prevTotalDistance += double.tryParse(activity.distance) ?? 0.0;
      prevTotalTime += int.tryParse(activity.timer) ?? 0;
    }

    // Trả về dữ liệu đã xử lý
    return ProgressData(
      currentWeekActivities: currentActivities,
      previousWeekDistance: prevTotalDistance,
      previousWeekTime: prevTotalTime,
    );
  }

  Future<void> refresh() async {
    await build();
  }
}

/// Provider cho controller
final progressTabControllerProvider = AsyncNotifierProvider<ProgressTabController, ProgressData>(
  ProgressTabController.new,
);

// Thêm provider cho repository của bạn nếu chưa có
final activityReposProvider = Provider<SActivityRepos>((ref) => SActivityRepos());
