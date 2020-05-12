import 'package:kokolog/model/kokoro_enum.dart';
import 'package:kokolog/model/record_model.dart';

class ChartData {
  final int day;
  int kokoro;

  ChartData({this.day, Kokoro kokoro}) {
    this.kokoro = kokoro.value;
  }

  static ChartData fromRecordModel(RecordModel data) {
    return ChartData(
      day: data.day,
      kokoro: KokoroExt.fromDouble(data.kokoro.toDouble()),
    );
  }
}
