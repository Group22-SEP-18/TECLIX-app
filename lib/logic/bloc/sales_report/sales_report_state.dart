import 'package:flutter/material.dart';
import 'package:teclix/data/models/current_month_stat.dart';

@immutable
class SalesReportState {
  final String error;
  final bool loadingData;
  final bool fetchFailed;
  final CurrentMonthStat currentMonthStat;
  final Map<int, double> monthlyStatList;

  SalesReportState({
    @required this.error,
    @required this.loadingData,
    @required this.fetchFailed,
    @required this.currentMonthStat,
    @required this.monthlyStatList,
  });

  static SalesReportState get initialState => SalesReportState(
        error: '',
        loadingData: false,
        fetchFailed: false,
        currentMonthStat: CurrentMonthStat(),
        monthlyStatList: {},
      );

  SalesReportState clone({
    String error,
    bool loadingData,
    bool fetchFailed,
    CurrentMonthStat currentMonthStat,
    Map<int, double> monthlyStatList,
  }) {
    return SalesReportState(
      error: error ?? this.error,
      loadingData: loadingData ?? this.loadingData,
      fetchFailed: fetchFailed ?? this.fetchFailed,
      currentMonthStat: currentMonthStat ?? this.currentMonthStat,
      monthlyStatList: monthlyStatList ?? this.monthlyStatList,
    );
  }
}
