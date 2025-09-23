import 'package:strava/data/services/activity/activity_services.dart';
import 'package:strava/features/core/models/activity_model.dart';
import 'package:strava/utils/exceptions/handle_exception/handle_firebase_exception.dart';

class SActivityRepos {
  static final SActivityRepos _instance = SActivityRepos._internal();

  SActivityRepos._internal();

  factory SActivityRepos() => _instance;

  // variables
  final _activityService = SActivityServices();

  Future<bool> createActivity(SActivityModel activity) async {
    return await SHandleFirebaseException<bool>(() async {
      final idxUser = await _activityService.createActivity(activity);
      return idxUser != 0 ? true : false;
    });
  }

  Future<List<SActivityModel>> getRowsInGivenWeek(int numOfWeek) async {
    return await SHandleFirebaseException(() async {
      final activities = await _activityService.getRowsInGivenWeek(numOfWeek);

      return activities.map((a) => SActivityModel.fromMap(a)).toList();
    });
  }

  /// get a [limit] activities
  Future<List<SActivityModel>> getTopRowsByGivenNumber(int limit) async {
    return await SHandleFirebaseException(() async {
      final activities = await _activityService.getTopRowsByGivenNumber(limit);

      return activities.map((a) => SActivityModel.fromMap(a)).toList();
    });
  }

}