import 'package:flutter/material.dart';
import 'package:kokolog/dao/dao.dart';
import 'package:kokolog/model/record_model.dart';
import 'package:sqflite/sql.dart';

class Record extends Dao {
  @override
  String get tableName => "records";

  Future<int> save(RecordModel record) async {
    final db = await database;

    if (record.id == null) {
      // すでに同じ日付のレコードが存在するか
      var existsData =
          findBy(year: record.year, month: record.month, day: record.day);

      existsData.then((data) async {
        if (data != null) {
          return await db.update(
            tableName,
            record.toMap(),
            where: "id = ?",
            whereArgs: [data.id],
          );
        }

        return await db.insert(
          tableName,
          record.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      });
    } else {
      return await db.update(tableName, record.toMap());
    }
  }

  Future<RecordModel> findBy(
      {@required int year, @required int month, @required int day}) async {
    final db = await database;

    final data = await db.query(
      tableName,
      where: "year = ? and month = ? and day = ?",
      whereArgs: [year, month, day],
    );

    if (data.isEmpty) {
      return null;
    }

    return RecordModel.fromMap(data.first);
  }

  Future<List<RecordModel>> findBetween(
      {@required DateTime from, @required DateTime to}) async {
    final db = await database;

    final maps = await db.query(
      tableName,
//      where:
//          "year >= ? and month >= ? and day >= ? and year <= ? and month <= ? and day <= ?",
//      whereArgs: [from.year, from.month, from.day, to.year, to.month, to.day],
      orderBy: "year desc, month desc, day desc",
    );

    return Future.wait(maps.map((record) async {
      return RecordModel.fromMap(record);
    }));
  }
}
