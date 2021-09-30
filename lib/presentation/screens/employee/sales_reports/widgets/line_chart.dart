import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class SalesLineChart extends StatelessWidget {
  final Map<int, double> data;

  SalesLineChart({this.data});
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white.withOpacity(0.9),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: ColorPrimary),
        ),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 330.0,
            child: SfCartesianChart(
                title: ChartTitle(
                    text: 'Monthly Total sales',
                    textStyle: TextStyle(color: ColorPrimary, fontSize: 18.0)),

                // Initialize category axis
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(),
                series: <ChartSeries>[
                  // Initialize line series
                  LineSeries<SalesData, String>(
                      markerSettings: MarkerSettings(
                        isVisible: true,
                      ),
                      color: ColorPrimary,
                      dataSource: SalesData.generatesalesData(
                          data: data, months: months),
                      xValueMapper: (SalesData sales, _) => sales.month,
                      yValueMapper: (SalesData sales, _) => sales.sales)
                ]),
          ),
        ));
  }
}

class SalesData {
  SalesData(this.month, this.sales);
  final String month;
  final double sales;

  static List<SalesData> generatesalesData(
      {List<String> months, Map<int, double> data}) {
    List<SalesData> list = [];
    for (int i = 0; i < DateTime.now().month; i++) {
      var value = data[i + 1] ?? 0.00;
      list.add(SalesData(months[i], value));
    }
    return list;
  }
}
