import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'salesperson_profile_event.dart';
import 'salesperson_profile_state.dart';

class SalespersonProfileBloc extends Bloc<SalespersonProfileEvent, SalespersonProfileState> {
  SalespersonProfileBloc(BuildContext context) : super(SalespersonProfileState.initialState);

  @override
  Stream<SalespersonProfileState> mapEventToState(SalespersonProfileEvent event) async* {
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
