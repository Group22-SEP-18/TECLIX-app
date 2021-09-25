import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teclix/data/services/asset_vehicle_service.dart';

import 'salesperson_vehicle_event.dart';
import 'salesperson_vehicle_state.dart';

class SalespersonVehicleBloc
    extends Bloc<SalespersonVehicleEvent, SalespersonVehicleState> {
  SalespersonVehicleBloc(BuildContext context)
      : super(SalespersonVehicleState.initialState) {
    _initialize(context);
  }

  Future<void> _initialize(context) async {
    add(FetchVehicleDataEvent());
  }

  int getItemCount() {
    int count = 0;
    state.salespersonVehicle.assignedVehicle.forEach((element) {
      count += element.quantity;
    });
    return count;
  }

  @override
  Stream<SalespersonVehicleState> mapEventToState(
      SalespersonVehicleEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case FetchVehicleDataEvent:
        yield state.clone(loadingData: true);
        var prefs = await SharedPreferences.getInstance();
        final token = (prefs.getString('token') ?? '');
        var response = await AssetVehicleService.fetchVehicleData(token: token);
        yield state.clone(
          loadingData: false,
          salespersonVehicle: response,
        );
        yield state.clone(
          totalItems: getItemCount(),
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
