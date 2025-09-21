import 'package:strava/data/services/weekly_activity/weekly_activity_services.dart';
import 'package:strava/features/core/models/weekly_activity_model.dart';
import 'package:strava/utils/exceptions/handle_exception/handle_firebase_exception.dart';

class SWeeklyActivityRepos {
  static final SWeeklyActivityRepos _instance = SWeeklyActivityRepos._internal();

  SWeeklyActivityRepos._internal();

  factory SWeeklyActivityRepos() => _instance;

  // variables
  final _weeklyActivityServices = SWeeklyActivityServices();

  Future<bool> createOrUpdateWeeklyActivity(SWeeklyActivityModel weeklyActivity) async {
    return await SHandleFirebaseException<bool>(() async {
      final idxUser = await _weeklyActivityServices.createOrUpdate(weeklyActivity);
      return idxUser != 0 ? true : false;
    });
  }

  /// Lấy 2 dòng tương ứng với tuần hiện tại và tuần trước 
  /// 
  /// Luôn trả về mảng 2 giá trị. 
  Future<List<SWeeklyActivityModel>> getPreviousAndCurrentWeeklyRow() async {
    return await SHandleFirebaseException(() async {
      final previousWeekRowId = SWeeklyActivityModel.generateId(isPreviousWeek: true);
      final currentWeekRowId = SWeeklyActivityModel.generateId();

      final rows = await _weeklyActivityServices.getPreviousAndCurrentWeeklyRow();

      if(rows.isEmpty) {
        return [
          SWeeklyActivityModel.empty(id: previousWeekRowId),
          SWeeklyActivityModel.empty(id: currentWeekRowId)
        ];
      }

      if(rows.length == 1) {
        final result = SWeeklyActivityModel.fromMap(rows[0]);
        if(result.id == previousWeekRowId) {
          return [
            result,
            SWeeklyActivityModel.empty(id: currentWeekRowId)
          ];
        } else {
          return [
            SWeeklyActivityModel.empty(id: previousWeekRowId),
            result
          ];
        }
      }

      return rows.map((e) => SWeeklyActivityModel.fromMap(e)).toList();
    });
  }

}