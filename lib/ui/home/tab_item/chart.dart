import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:kokolog/view_model/chart_view_model.dart';
import 'package:provider/provider.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<ChartViewModel>(context, listen: false)
            .chartDataList
            .length <
        1) {
      Provider.of<ChartViewModel>(context).refresh();

      return Center();
    }

    return Center(
      child: charts.TimeSeriesChart(
        Provider.of<ChartViewModel>(context).chartDataList,
        animate: true,
        behaviors: [
          charts.ChartTitle(
            '履歴',
            behaviorPosition: charts.BehaviorPosition.top,
            titleOutsideJustification: charts.OutsideJustification.start,
          ),
        ],
      ),
    );
  }
}
