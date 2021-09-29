import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/sales_report/sales_report_bloc.dart';
import 'package:teclix/logic/bloc/sales_report/sales_report_event.dart';
import 'package:teclix/logic/bloc/sales_report/sales_report_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/constants/utils.dart';
import 'package:teclix/presentation/common/widgets/appbar_back_btn.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/screens/employee/sales_reports/widgets/doughnut_chart.dart';
import 'package:teclix/presentation/screens/employee/sales_reports/widgets/line_chart.dart';
import 'package:teclix/presentation/screens/employee/sales_reports/widgets/sales_stat_card.dart';

class SalesMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reportBloc = BlocProvider.of<SalesReportBloc>(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Stack(
            children: [
              Positioned(
                left: 10.0,
                top: 0.0,
                child: HeaderBackButton(
                  whenTapped: () => Navigator.pop(context),
                ),
              ),
              Align(
                child: AppbarHeadingText(
                  title: 'Sales',
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<SalesReportBloc, SalesReportState>(
          buildWhen: (prev, cur) => prev.loadingData != cur.loadingData,
          builder: (context, state) {
            return Stack(
              children: [
                Center(
                    child: Image.asset('static/images/sales_main_cover.png')),
                state.loadingData
                    ? Center(
                        child: SizedBox(
                          height: 80.0,
                          width: 80.0,
                          child: CircularProgressIndicator(
                            color: ColorYellow,
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        physics: ClampingScrollPhysics(),
                        child: CommonPadding(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 25.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Row(
                                  children: [
                                    Text(
                                      'Month: ' +
                                          Utils.returnMonth(DateTime.now()),
                                      style: TextStyle(
                                        fontSize: 25.0,
                                        color: ColorPrimary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                      onTap: () =>
                                          reportBloc.add(FetchReportData()),
                                      child: Icon(
                                        Icons.refresh_rounded,
                                        color: ColorPrimary,
                                        size: 40.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              BlocBuilder<SalesReportBloc, SalesReportState>(
                                builder: (context, state) {
                                  return Row(
                                    children: [
                                      Expanded(
                                        child: SalesStatCard(
                                          image:
                                              'static/images/total_sales.png',
                                          title: 'Total Sales',
                                          amount:
                                              state.currentMonthStat.totalSales,
                                          primary: ColorBlue,
                                        ),
                                        flex: 1,
                                      ),
                                      Expanded(
                                        child: SalesStatCard(
                                          image: 'static/images/grow.png',
                                          title: 'Total Late payments',
                                          amount: state
                                              .currentMonthStat.totalLatePay,
                                          primary: ColorGold,
                                        ),
                                        flex: 1,
                                      ),
                                    ],
                                  );
                                },
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              SalesLineChart(),
                              SizedBox(
                                height: 15.0,
                              ),
                              DoughnutCharts(),
                            ],
                          ),
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
