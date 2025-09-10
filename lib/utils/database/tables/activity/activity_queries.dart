import 'package:strava/utils/database/tables/activity/activity_table.dart';
import 'package:strava/utils/database/tables/user/user_table.dart';

class SActivityQueries {
  static String getActivitiesByUserId ({
    required String userId,
    int limit = 10,
    int page = 1, 
  }) {
    int offset = (page - 1) * limit;

    return '''
      select * from ${SActivityTable.tableName} as activity
      join ${SUserTable.tableName} as user on user.${SUserTable.columnUserId} = activity.${SActivityTable.columnUserId}
      where user.${SUserTable.columnUserId} = '$userId' and activity.${SActivityTable.columnStatus} = 1
      limit $limit
      offset $offset
    ''';
  }
}