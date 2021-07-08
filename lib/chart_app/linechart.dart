import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'models.dart';

class LineChartPage extends StatelessWidget {
  var chartData = <SalesData>[
    SalesData('Jan', 15),
    SalesData('Feb', 38),
    SalesData('Mar', 24),
    SalesData('Apr', 42),
    SalesData('May', 30),
    SalesData('jun', 50),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SfCartesianChart(

              primaryXAxis: CategoryAxis(),

              series: <LineSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                    dataSource:  chartData,
                    xValueMapper: (SalesData sales, _) => sales.year,
                    yValueMapper: (SalesData sales, _) => sales.sales,
                    dataLabelSettings: DataLabelSettings(isVisible: true)
                )
              ],
        ),
        ),
      ],
    );

  }
}
