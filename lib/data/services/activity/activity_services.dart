import 'package:intl/intl.dart';
import 'package:strava/features/core/models/activity_model.dart';
import 'package:strava/utils/database/database.dart';
import 'package:strava/utils/database/tables/activity/activity_table.dart';

class SActivityServices {
  static final SActivityServices _instance = SActivityServices._internal();

  SActivityServices._internal();

  factory SActivityServices() => _instance;

  // variable
  final _db = SDatabase().db;

  /// create new activity
  Future<int> createActivity(SActivityModel activity) async {
    return await _db.insert(
      SActivityTable.tableName, 
      activity.toMap()
    );
  }

  Future<List<Map<String, dynamic>>> getRowsInGivenWeek(int numOfWeek) async {

    // lấy ngày bắt đầu và ngày kết thúc trong tuần
    int year = DateTime.now().year;

    // Tuần 1 ISO luôn chứa ngày thứ 4 của tháng 1
    DateTime jan4 = DateTime(year, 1, 4);

    // Thứ 2 của tuần 1
    DateTime startOfWeek1 = jan4.subtract(Duration(days: jan4.weekday - 1));

    // Ngày bắt đầu tuần được truyền vào
    DateTime startOfWeek = startOfWeek1.add(Duration(days: (numOfWeek - 1) * 7));

    // Ngày kết thúc tuần
    DateTime endOfWeek = startOfWeek.add(const Duration(days: 6, hours: 23, minutes: 59, seconds: 59));

    final formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    final startStr = formatter.format(startOfWeek);
    final endStr = formatter.format(endOfWeek);

    return await _db.query(
      SActivityTable.tableName,
      where: '${SActivityTable.columnCreateAt} BETWEEN ? AND ?',
      whereArgs: [startStr, endStr],
    );
  }

  /// get a [limit] rows
  Future<List<Map<String, dynamic>>> getTopRowsByGivenNumber(int limit) async {
    return await _db.query(
      SActivityTable.tableName,
      limit: limit
    );
  }
}