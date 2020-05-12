import 'package:flutter/material.dart';
import 'package:kokolog/entity/chart_data.dart';
import 'package:kokolog/repository/record_repository.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ChartViewModel extends ChangeNotifier {
  List<charts.Series<dynamic, num>> chartDataList = [];

  final RecordRepository repo;

  ChartViewModel(this.repo) {
    refresh();
  }

  refresh() {
    // 今日から1ヶ月分を取得
    final to = DateTime.now();
    final from = DateTime(to.year, to.month - 1, to.day);

    final future = repo.getBy(from: from, to: to);
    future.then((list) {
      final List<ChartData> datas =
          list.map((e) => ChartData.fromRecordModel(e)).toList();

      chartDataList.add(charts.Series<ChartData, int>(
        id: 'Record',
        domainFn: (ChartData data, _) => data.day,
        measureFn: (ChartData data, _) => data.kokoro,
        data: datas,
      ));

      notifyListeners();
    });
  }
}
