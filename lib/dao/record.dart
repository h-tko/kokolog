import 'package:kokolog/dao/dao.dart';
import 'package:kokolog/model/record_model.dart';
import 'package:sqflite/sql.dart';

class Record extends Dao {
  @override
  String get tableName => throw UnimplementedError();

  Future<int> save(RecordModel record) async {
    final db = await database;

    if (record.id == null) {
      return await db.insert(
        tableName,
        record.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } else {
      return await db.update(tableName, record.toMap());
    }
  }
}
