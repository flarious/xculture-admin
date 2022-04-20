/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleReportBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  SimpleReportBarChart( this.seriesList, {required this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleReportBarChart.withSampleReportData() {
    return new SimpleReportBarChart(
      _createSampleReportData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<ReportAmount, String>> _createSampleReportData() {
    final data = [
      new ReportAmount('Forum', 5),
      new ReportAmount('Event', 20),
      new ReportAmount('Community', 44),
    ];

    return [
      new charts.Series<ReportAmount, String>(
        id: 'Amount',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (ReportAmount amount, _) => amount.report,
        measureFn: (ReportAmount amount, _) => amount.amount,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class ReportAmount {
  final String report;
  final int amount;
  ReportAmount(this.report, this.amount);
}