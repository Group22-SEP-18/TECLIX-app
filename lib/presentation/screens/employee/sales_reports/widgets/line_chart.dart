import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class SalesLineChart extends StatelessWidget {
  const SalesLineChart({
    Key key,
  }) : super(key: key);

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
                      // dataLabelSettings: DataLabelSettings(
                      //     // Renders the data label
                      //     isVisible: true),
                      color: ColorPrimary,
                      dataSource: [
                        // Bind data source
                        SalesData('Jan', 2000),
                        SalesData('Feb', 2448),
                        SalesData('Mar', 4434),
                        SalesData('Apr', 15232),
                        SalesData('May', 1440),
                        SalesData('jun', 1135),
                        SalesData('Jul', 8828),
                        SalesData('Aug', 8834),
                        SalesData('Sep', 7732),
                      ],
                      xValueMapper: (SalesData sales, _) => sales.year,
                      yValueMapper: (SalesData sales, _) => sales.sales)
                ]),
          ),
        ));
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
