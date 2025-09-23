import 'package:strava/features/core/models/activity_model.dart';

abstract class SRecentlyImagesControllerAbstract {
  Future<List<SActivityModel>> getRecentlyActivities();
}