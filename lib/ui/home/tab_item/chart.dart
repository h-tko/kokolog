import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:kokolog/model/kokoro_enum.dart';
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
        animate: false,
        primaryMeasureAxis: charts.NumericAxisSpec(
          tickFormatterSpec: charts.BasicNumericTickFormatterSpec(
            (num value) {
              Kokoro kokoro;
              Kokoro.values.forEach((element) {
                if (element.value == value) {
                  kokoro = element;
                }
              });

              return kokoro.description;
            },
          ),
        ),
      ),
    );
  }
}
