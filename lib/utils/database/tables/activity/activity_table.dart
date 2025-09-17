import 'package:strava/utils/database/tables/user/user_table.dart';

class SActivityTable {
  static const String tableName = 'Activities';

  static const String columnId = "id";
  static const String columnCreateAt = 'createAt';
  static const String columnTimer = 'timer';
  static const String columnPace = 'pace';
  static const String columnDistance = 'distance';
  static const String columnStatus = 'status';
  static const String columnRoutePoints = 'routePoints';
  static const String columnUserId = SUserTable.columnUserId;
  static const String columnImagePath = 'imagePath';

  static const String createTableQuery = '''
    CREATE TABLE IF NOT EXISTS $tableName (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnTimer TEXT NOT NULL,
      $columnDistance TEXT NOT NULL,
      $columnPace TEXT NOT NULL,
      $columnStatus INTEGER NOT NULL DEFAULT 1,
      $columnCreateAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      $columnRoutePoints TEXT NOT NULL,
      $columnUserId TEXT,
      FOREIGN KEY($columnUserId) REFERENCES ${SUserTable.tableName}(${SUserTable.columnUserId})
    );
  ''';

  static const String createForeignKeyIndex = '''
    CREATE INDEX IF NOT EXISTS idx_${tableName}_$columnUserId ON $tableName($columnUserId);
  ''';

  static const String addImagePathColumn = '''
    ALTER TABLE $tableName ADD COLUMN $columnImagePath TEXT NOT NULL DEFAULT '';
  ''';

}