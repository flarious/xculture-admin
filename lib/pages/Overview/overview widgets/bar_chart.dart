/// Bar chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class SimpleBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  SimpleBarChart( this.seriesList, {required this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory SimpleBarChart.withSampleData() {
    return new SimpleBarChart(
      _createSampleData(),
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
  static List<charts.Series<ForumAmount, String>> _createSampleData() {
    final data = [
      new ForumAmount('January', 9),
      new ForumAmount('Febuary', 15),
      new ForumAmount('March', 20),
      new ForumAmount('April', 5),
    ];

    return [
      new charts.Series<ForumAmount, String>(
        id: 'Amount',
        colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
        domainFn: (ForumAmount amount, _) => amount.year,
        measureFn: (ForumAmount amount, _) => amount.amount,
        data: data,
      )
    ];
  }
}

/// Sample ordinal data type.
class ForumAmount {
  final String year;
  final int amount;

  ForumAmount(this.year, this.amount);
}