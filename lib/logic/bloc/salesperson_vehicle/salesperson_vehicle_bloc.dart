import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'salesperson_vehicle_event.dart';
import 'salesperson_vehicle_state.dart';

class SalespersonVehicleBloc extends Bloc<SalespersonVehicleEvent, SalespersonVehicleState> {
  SalespersonVehicleBloc(BuildContext context) : super(SalespersonVehicleState.initialState);

  @override
  Stream<SalespersonVehicleState> mapEventToState(SalespersonVehicleEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
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
      add(ErrorEvent((e is String) ? e : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again!"));
    }
  }
}
