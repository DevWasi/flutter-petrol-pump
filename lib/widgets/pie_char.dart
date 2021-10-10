import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

buildPieChart(chartName, pieSeries, chartData) {

  return SfCircularChart(
    series: <CircularSeries>[pieSeries],
    tooltipBehavior: TooltipBehavior(enable: true),
    palette: const <Color>[Colors.greenAccent, Colors.brown, Colors.green, Colors.redAccent, Colors.blueAccent],
    title: ChartTitle(
        text: chartName.toUpperCase(),
        textStyle: const TextStyle(color: Colors.black)
    ),
  );
}
