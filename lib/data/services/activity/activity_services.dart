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
}