import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teclix/data/services/report_service.dart';

import 'sales_report_event.dart';
import 'sales_report_state.dart';

class SalesReportBloc extends Bloc<SalesReportEvent, SalesReportState> {
  SalesReportBloc(BuildContext context) : super(SalesReportState.initialState);

  @override
  Stream<SalesReportState> mapEventToState(SalesReportEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case FetchReportData:
        yield state.clone(loadingData: true);
        var prefs = await SharedPreferences.getInstance();
        final token = (prefs.getString('token') ?? '');
        final id = (prefs.getString('id') ?? '');
        var curMonth =
            await ReportService.fetchCurrentMonthStats(token: token, id: id);
        var mothlyStat =
            await ReportService.fetchMonthlySales(token: token, id: id);
        var mothlyStatComp =
            await ReportService.fetchMonthlyStats(token: token, id: id);
        yield state.clone(
          loadingData: false,
          currentMonthStat: curMonth,
          monthlyStatList: mothlyStat,
          monthlyStatComparison: mothlyStatComp,
        );
        // print(state.dailyStats.totalSales);
        break;
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    _addErr(error);
    super.onError(error, stacktrace);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _addErr(e) {
    if (e is StateError) return;
    try {
      add(ErrorEvent((e is String)
          ? e
          : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again!"));
    }
  }
}
