import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'models.dart';

class PieChartPage extends StatefulWidget {

  @override
  _PieChartPageState createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  @override
   var chartData =<SalesData>[
    SalesData('Jan', 15),
    SalesData('Feb', 38),
    SalesData('Mar', 24),
    SalesData('Apr', 42),
    SalesData('May', 30),
    SalesData('jun', 50),
  ];
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfCircularChart(
            legend: Legend(isVisible: true,overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <CircularSeries>[
              PieSeries<SalesData,String>(dataSource: chartData,
                  xValueMapper: (SalesData data,_)=> data.year,
                  yValueMapper: (SalesData data,_)=> data.sales,
                dataLabelSettings: DataLabelSettings(isVisible: true),
              ),
            ],


          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
