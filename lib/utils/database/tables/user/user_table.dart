class SUserTable {
  static const String tableName = 'Users';

  static const String columnUserId = "userId";

  static const String createTableQuery = '''
    CREATE TABLE IF NOT EXISTS $tableName (
      $columnUserId TEXT PRIMARY KEY
    );
  ''';
}