import 'package:kokolog/dao/record.dart';
import 'package:kokolog/model/record_model.dart';

class RecordRepository {
  final Record dao;

  RecordRepository(this.dao);

  Future<int> save(RecordModel record) => dao.save(record);
}
