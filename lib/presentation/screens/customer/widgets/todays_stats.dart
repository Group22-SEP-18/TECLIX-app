import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class TodaysStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Late Payments', 10, ColorYellow),
      ChartData('Service Orders', 22, ColorBlue),
      ChartData('Stores visited', 22, ColorPrimary)
    ];
    return Center(
        child: Container(
      child: SfCircularChart(
          legend: Legend(
              iconHeight: 22.0,
              isVisible: true,
              position: LegendPosition.right,
              textStyle: TextStyle(fontSize: 16.0)),
          title: ChartTitle(
              text: 'Today\'s Stats',
              textStyle: TextStyle(color: ColorPrimary, fontSize: 18.0)),
          series: <CircularSeries>[
            // Renders doughnut chart
            DoughnutSeries<ChartData, String>(
              // dataLabelMapper: (ChartData data, _) => data.x,
              dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                  labelPosition: ChartDataLabelPosition.inside,
                  useSeriesColor: true,
                  textStyle: TextStyle(fontSize: 16.0, color: Colors.white)),
              dataSource: chartData,
              pointColorMapper: (ChartData data, _) => data.color,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
            )
          ]),
    ));
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final int y;
  final Color color;
}
