// ignore_for_file: non_constant_identifier_names

import 'package:strava/utils/database/tables/activity/activity_table.dart';
import 'package:strava/utils/database/tables/user/user_table.dart';

/// save `SQL_CMD` for specific `database version`
/// ```dart
/// Map<int, String> migrationScripts = {
///    1: '''CREATE TABLE users (
///      id INTEGER PRIMARY KEY,
///      first_name TEXT
///  )'''
/// };
/// ```
final Map<int, String> SDbMigration = {
  1: '''
    ${SUserTable.createTableQuery}
    ${SActivityTable.createTableQuery}
    ${SActivityTable.createForeignKeyIndex}
  '''
};