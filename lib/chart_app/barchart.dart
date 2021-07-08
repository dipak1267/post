import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
class SalesData {
  SalesData( this.sales,this.year);
  final String year;
  final double sales;
}


class BarChartPage extends StatelessWidget {

  var chartData = <SalesData>[
    SalesData(15,'Jan'),
    SalesData(38,"feb"),
    SalesData(24,"MARCH"),
    SalesData(42,"JUN"),
    SalesData(30,"JULY"),
    SalesData(50,"Jun"),
  ];
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: SfCartesianChart(
            enableAxisAnimation: false,
            primaryXAxis: CategoryAxis(),
          series: <BarSeries>[
            BarSeries<SalesData,String>(

                dataSource: chartData,
                xValueMapper: (SalesData gdp,_)=> gdp.year,
                yValueMapper: (SalesData gdp,_)=> gdp.sales)
          ],
          ),
        ),
      ],
    );
  }
}
