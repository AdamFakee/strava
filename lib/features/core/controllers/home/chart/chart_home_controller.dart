import 'package:strava/data/repos/activity/activity_repos.dart';
import 'package:strava/features/core/controllers/home/chart/chart_home_controller_abstract.dart';
import 'package:strava/features/core/models/activity_model.dart';
import 'package:strava/utils/extensions/date_time_extensions.dart';
import 'package:strava/utils/helpers/helper_function.dart';

class SChartHomeController implements SChartHomeControllerAbstract{
  // variable
  final _activitiesRepos = SActivityRepos();

  @override
  Future<List<SActivityModel>> getActivitiesByGivenWeek({int? givenWeek}) async {
    final now = DateTime.now();
    final week = now.weekNumber(now);
    final year = now.year;
    final activities = await _activitiesRepos.getRowsInGivenWeek(givenWeek ?? week);

    final List<SActivityModel> result = List.generate(7, (_) => SActivityModel.empty());

    final dayInWeeks = SHelperFunction.getDaysInWeek(year, week);

    int i = 0;
    for (var a in activities) {
      final createAt = a.createAt;
      while(i < dayInWeeks.length) {
        if(createAt!.startsWith(dayInWeeks[i]['date']!)) {
          final oldDistance =double.parse(result[i].distance);
          final oldTimer = double.parse(result[i].timer);
          final newDistance = oldDistance + double.parse(a.distance);
          final newTimer = oldTimer + double.parse(a.timer);
          result[i] = result[i].copyWith(
            distance: newDistance.toString(),
            timer: newTimer.toString(),
          );
          break;
        }
        i++;
      }
    }
    return result;
  }

}