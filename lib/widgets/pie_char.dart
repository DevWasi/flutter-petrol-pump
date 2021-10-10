import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:h2n_app/utils/helper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}

buildPieChart(data) {
  final List<ChartData> chartData = [
    ChartData('Total', data["total"]),
    ChartData('Remaining', data["remaining"]),
    ChartData('sold', data["sold"])
  ];
  return SfCircularChart(series: <CircularSeries>[
    // Render pie chart
    PieSeries<ChartData, String>(
        enableTooltip: true,
        dataSource: chartData,
        xValueMapper: (ChartData data, _) => data.x,
        yValueMapper: (ChartData data, _) => data.y
    )
  ],
      tooltipBehavior: TooltipBehavior(enable: true),
      palette: const <Color>[Colors.greenAccent, Colors.brown, Colors.green, Colors.redAccent, Colors.blueAccent],
      title: ChartTitle(
          text: data["stock_type"].toUpperCase(),
          textStyle: const TextStyle(color: Colors.black)
      ),
  );
}
