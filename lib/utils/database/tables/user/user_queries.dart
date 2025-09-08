import 'package:strava/utils/database/tables/user/user_table.dart';

class SUserQueries {
  static String createUserIfNotExitsByUserId (String userId) {
    return '''
      insert or ignore into ${SUserTable.tableName} (${SUserTable.columnUserId})
      values ('$userId')
    ''';
  } 
}