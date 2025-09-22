import 'package:strava/features/core/models/activity_model.dart';

abstract class SChartHomeControllerAbstract {
  /// trả về danh sách các hoạt động trong tuần hiện tại
  Future<List<SActivityModel>> getActivitiesByGivenWeek ();
}