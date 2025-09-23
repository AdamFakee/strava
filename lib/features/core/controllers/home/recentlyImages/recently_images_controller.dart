import 'package:strava/data/repos/activity/activity_repos.dart';
import 'package:strava/features/core/controllers/home/recentlyImages/recently_images_controller_abstract.dart';
import 'package:strava/features/core/models/activity_model.dart';

class SRecentlyImagesController implements SRecentlyImagesControllerAbstract {
  final _activitiesRepos = SActivityRepos();

  @override
  Future<List<SActivityModel>> getRecentlyActivities() async {
    return await _activitiesRepos.getTopRowsByGivenNumber(4);
  }
}