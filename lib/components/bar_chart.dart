import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarChart extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> {
  List<TransactionData> _chartData;
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height,
      child: SfCartesianChart(
        title: ChartTitle(
            text: 'Transactions',
            alignment: ChartAlignment.near,
            textStyle: TextStyle(fontSize: 25)),
        legend: Legend(isVisible: true, position: LegendPosition.top),
        tooltipBehavior: _tooltipBehavior,
        series: <ChartSeries>[
          ColumnSeries<TransactionData, String>(
              name: 'In',
              dataSource: _chartData,
              xValueMapper: (TransactionData transaction, _) =>
                  transaction.month,
              yValueMapper: (TransactionData transaction, _) =>
                  transaction.income,
              dataLabelSettings: DataLabelSettings(isVisible: false),
              color: Colors.deepPurpleAccent,
              enableTooltip: true),
          ColumnSeries<TransactionData, String>(
              name: 'Out',
              dataSource: _chartData,
              xValueMapper: (TransactionData transaction, _) =>
                  transaction.month,
              color: Colors.black87,
              yValueMapper: (TransactionData transaction, _) => transaction.out,
              dataLabelSettings: DataLabelSettings(isVisible: false),
              enableTooltip: true)
        ],
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(
          isVisible: false,
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          numberFormat: NumberFormat.simpleCurrency(decimalDigits: 0),
          // title: AxisTitle(text: 'Transaction in billions of U.S. Dollars'),
        ),
      ),
    );
  }

  List<TransactionData> getChartData() {
    final List<TransactionData> chartData = [
      TransactionData('JAN', 160, 499),
      TransactionData('FEB', 249, 900),
      TransactionData('MAR', 200, 999),
      TransactionData('APR', 230, 902),
      TransactionData('MAY', 240, 234),
    ];
    return chartData;
  }
}

class TransactionData {
  TransactionData(this.month, this.income, this.out);
  final String month;
  final double income;
  final double out;
}
