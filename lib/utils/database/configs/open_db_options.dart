import 'dart:async';

import 'package:sqflite/sqflite.dart';
import 'package:strava/utils/database/configs/db_migration.dart';

class SOpenDbOptions {
  static final int _nbMigration = SDbMigration.length;
  
  static FutureOr<void> onConfigure (Database db) async {
    // enable foreign key
    await db.execute('PRAGMA foreign_keys = ON');
  }

  static FutureOr<void> onCreate (Database db, int currentVersion) async {
    await db.transaction((txn) async {
      for (int i = 1; i <= _nbMigration; i++) {
        await txn.execute(SDbMigration[i]!);
      }
    });
  }

  static FutureOr<void> onUpgrade (Database db, int oldVersion, int newVersion) async {
    await db.transaction((txn) async {
      for (int i = oldVersion + 1; i <= newVersion; i++) {
        await db.execute(SDbMigration[i]!);
      }
    });
  }

  static FutureOr<void> onDownGrade (Database db, int oldVersion, int newVersion) async {

  }
}