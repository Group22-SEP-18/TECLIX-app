import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class DoughnutCharts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Late Payments', 10, ColorYellow),
      ChartData('Service Orders', 22, ColorBlue),
      ChartData('Stores visited', 22, ColorPrimary)
    ];
    return Center(
        child: Card(
            color: Colors.white.withOpacity(0.7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(color: ColorPrimary),
            ),
            elevation: 3,
            child: Container(
              height: 350.0,
              child: SfCircularChart(
                  legend: Legend(
                      iconHeight: 22.0,
                      isVisible: true,
                      position: LegendPosition.bottom,
                      textStyle: TextStyle(fontSize: 16.0)),
                  title: ChartTitle(
                      text: 'Today\'s Stats',
                      textStyle:
                          TextStyle(color: ColorPrimary, fontSize: 18.0)),
                  series: <CircularSeries>[
                    // Renders doughnut chart
                    DoughnutSeries<ChartData, String>(
                      // dataLabelMapper: (ChartData data, _) => data.x,
                      dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          labelPosition: ChartDataLabelPosition.outside,
                          useSeriesColor: true,
                          textStyle:
                              TextStyle(fontSize: 16.0, color: Colors.white)),
                      dataSource: chartData,
                      pointColorMapper: (ChartData data, _) => data.color,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                    )
                  ]),
            )));
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final int y;
  final Color color;
}
