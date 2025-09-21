import 'package:strava/features/core/models/weekly_activity_model.dart';
import 'package:strava/utils/database/database.dart';
import 'package:strava/utils/database/tables/weekly_activity/weekly_activity_table.dart';

class SWeeklyActivityServices {
  static final SWeeklyActivityServices _instance = SWeeklyActivityServices._internal();

  SWeeklyActivityServices._internal();

  factory SWeeklyActivityServices() => _instance;

  // variable
  final _db = SDatabase().db;

  // --------------------- service methods -------------------

  Future<int> createOrUpdate (SWeeklyActivityModel data) async {
    return await _db.rawInsert('''
      INSERT INTO ${SWeeklyActivityTable.tableName}(
        ${SWeeklyActivityTable.columnId},
        ${SWeeklyActivityTable.columnTotalActivity},
        ${SWeeklyActivityTable.columnTotalTimer},
        ${SWeeklyActivityTable.columnTotalDistance},
        ${SWeeklyActivityTable.columnUserId}
      ) VALUES ('${data.id}', ${data.totalActivities}, ${data.totalTimer}, ${data.totalDistance}, '${data.userId}')
      ON CONFLICT(${SWeeklyActivityTable.columnId})
      DO UPDATE SET
        ${SWeeklyActivityTable.columnTotalActivity} = ${SWeeklyActivityTable.columnTotalActivity} + 1,
        ${SWeeklyActivityTable.columnTotalTimer} = ${SWeeklyActivityTable.columnTotalTimer} + excluded.${SWeeklyActivityTable.columnTotalTimer},
        ${SWeeklyActivityTable.columnTotalDistance} = ${SWeeklyActivityTable.columnTotalDistance} + excluded.${SWeeklyActivityTable.columnTotalDistance};
    ''');
  }

  Future<List<Map<String, Object?>>> getPreviousAndCurrentWeeklyRow () async {
    return await _db.query(
      SWeeklyActivityTable.tableName,
      where: '${SWeeklyActivityTable.columnId} IN (?, ?)',
      whereArgs: [
        SWeeklyActivityModel.generateId(isPreviousWeek: true),
        SWeeklyActivityModel.generateId()
      ]
    );
  }
  
}