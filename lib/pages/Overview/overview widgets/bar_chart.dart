/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:xculture_admin/helpers/api.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  SimpleBarChart( this.seriesList, {required this.animate});

  factory SimpleBarChart.fromData(List<GraphData> data) {
    return SimpleBarChart(
      _chartFromData(data), 
      animate: false
    );
  }

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  static List<charts.Series<GraphData, String>> _chartFromData(List<GraphData> data) {
    return [
      charts.Series<GraphData, String>(
        id: 'Amount',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (GraphData data, _) => data.name,
        measureFn: (GraphData data, _) => data.amount,
        data: data,
      )
    ];
  }
}