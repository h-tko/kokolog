import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

abstract class Dao {
  Database _instance;

  final String _databaseName = "kokolog.db";

  String get tableName;

  Future<Database> get database async {
    if (_instance != null) {
      return _instance;
    }

    _instance = await openDatabase(
      join(
        await getDatabasesPath(),
        _databaseName,
      ),
      onCreate: createDatabase,
      version: 1,
    );

    return _instance;
  }

  createDatabase(Database db, int version) {
    db.execute("""
    CREATE TABLE records(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      year INTEGER NOT NULL,
      month INTEGER NOT NULL,
      day INTEGER NOT NULL,
      kokoro INTEGER NOT NULL,
      reason TEXT NOT NULL
    );
    """);
  }
}
