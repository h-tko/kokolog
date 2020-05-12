import 'package:kokolog/model/kokoro_enum.dart';
import 'package:kokolog/model/record_model.dart';

class ChartData {
  final DateTime date;
  int kokoro;

  ChartData({this.date, Kokoro kokoro}) {
    this.kokoro = kokoro.value;
  }

  static ChartData fromRecordModel(RecordModel data) {
    return ChartData(
      date: DateTime(data.year, data.month, data.day),
      kokoro: KokoroExt.fromDouble(data.kokoro.toDouble()),
    );
  }
}
