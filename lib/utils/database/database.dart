import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:strava/main/app_env.dart';
import 'package:strava/utils/const/global.dart';
import 'package:strava/utils/database/configs/open_db_options.dart';

class SDatabase {
  // signle instance
  static final SDatabase _instance = SDatabase._internal();

  SDatabase._internal();

  factory SDatabase() => _instance;

  // variables
  late final Database _db;

  Database get db => _db;

  Future<void> init() async {
    _db = await _onpenDb();
  }

  Future<Database> _onpenDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, SGlobals.dbName);

    // nếu dbPath chưa tồn tại => tạo mới
    try {
      await Directory(dbPath).create(recursive: true);
    } catch (_) {
      throw ('Có lỗi khi khởi tạo database');
    }

    return await openDatabase(
      version: int.parse(SAppEnv.databaseVersion),
      path,
      onConfigure: SOpenDbOptions.onConfigure,
      onCreate: SOpenDbOptions.onCreate,
      onUpgrade: SOpenDbOptions.onUpgrade,
      onDowngrade: SOpenDbOptions.onDownGrade,
    );
  }

  Future<void> closeDb () async {
    await _db.close();
  }
}
