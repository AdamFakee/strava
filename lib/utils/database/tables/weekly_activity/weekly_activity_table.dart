import 'package:strava/utils/database/tables/user/user_table.dart';

class SWeeklyActivityTable {
  static const String tableName = 'WeeklyActivities';

  static const String columnId = "id"; // id = numOfWeek + currentYear
  static const String columnTotalActivity = 'totalActivities';
  static const String columnCreateAt = 'createAt';
  static const String columnTotalTimer = 'totalTimer';
  static const String columnTotalDistance = 'totalDistance';
  static const String columnUserId = SUserTable.columnUserId;

  static const String createTableQuery = '''
    CREATE TABLE IF NOT EXISTS $tableName (
      $columnId TEXT PRIMARY KEY,
      $columnTotalActivity INTEGER NOT NULL,
      $columnTotalTimer INTEGER NOT NULL,
      $columnTotalDistance REAL NOT NULL,
      $columnCreateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      $columnUserId TEXT,
      FOREIGN KEY($columnUserId) REFERENCES ${SUserTable.tableName}(${SUserTable.columnUserId})
    );
  ''';

  static const String createForeignKeyIndex = '''
    CREATE INDEX IF NOT EXISTS idx_${tableName}_$columnUserId ON $tableName($columnUserId);
  ''';

  // static const String createTriggerForTotalActivities = '''
  //   CREATE TRIGGER IF NOT EXIST update_${columnTotalActivity}_$tableName
  //   UPDATE OF $columnTotalActivity IN $tableName
  //   BEGIN
  //     UPDATE
  // ''';

}