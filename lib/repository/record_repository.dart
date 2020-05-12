import 'package:kokolog/dao/record.dart';
import 'package:kokolog/model/record_model.dart';
import 'package:flutter/material.dart';

class RecordRepository {
  final Record dao;

  RecordRepository(this.dao);

  Future<int> save(RecordModel record) => dao.save(record);

  Future<List<RecordModel>> getBy(
          {@required DateTime from, @required DateTime to}) =>
      dao.findBetween(from: from, to: to);
}
