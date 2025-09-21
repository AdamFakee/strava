// ignore_for_file: non_constant_identifier_names

import 'package:strava/utils/database/tables/activity/activity_table.dart';
import 'package:strava/utils/database/tables/user/user_table.dart';
import 'package:strava/utils/database/tables/weekly_activity/weekly_activity_table.dart';

/// save `SQL_CMD` for specific `database version`
/// ```dart
/// Map<int, String> migrationScripts = {
///    1: '''CREATE TABLE users (
///      id INTEGER PRIMARY KEY,
///      first_name TEXT
///  )'''
/// };
/// ```
// final Map<int, String> SDbMigration = {
//   1: '''
//     ${SUserTable.createTableQuery}
//     ${SActivityTable.createTableQuery}
//     ${SActivityTable.createForeignKeyIndex}
//   '''
// };

final Map<int, String> SDbMigration = {
  1: SUserTable.createTableQuery,
  2: SActivityTable.createTableQuery,
  3: SActivityTable.createForeignKeyIndex,
  4: SActivityTable.addImagePathColumn,
  5: SWeeklyActivityTable.createTableQuery,
  6: SWeeklyActivityTable.createForeignKeyIndex
};