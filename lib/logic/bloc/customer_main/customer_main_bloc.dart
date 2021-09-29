import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teclix/data/services/report_service.dart';

import 'customer_main_event.dart';
import 'customer_main_state.dart';

class CustomerMainBloc extends Bloc<CustomerMainEvent, CustomerMainState> {
  CustomerMainBloc(BuildContext context)
      : super(CustomerMainState.initialState) {
    _initialize(context);
  }
  Future<void> _initialize(context) async {
    add(FetchDailyStatEvent());
  }

  @override
  Stream<CustomerMainState> mapEventToState(CustomerMainEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case FetchDailyStatEvent:
        yield state.clone(loadingData: true);
        var prefs = await SharedPreferences.getInstance();
        final token = (prefs.getString('token') ?? '');
        final id = (prefs.getString('id') ?? '');
        var response =
            await ReportService.fetchDailyStats(token: token, id: id);
        yield state.clone(
          loadingData: false,
          dailyStats: response,
        );
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
