import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'customer_late_pay_event.dart';
import 'customer_late_pay_state.dart';

class CustomerLatePayBloc
    extends Bloc<CustomerLatePayEvent, CustomerLatePayState> {
  CustomerLatePayBloc(BuildContext context)
      : super(CustomerLatePayState.initialState);

  @override
  Stream<CustomerLatePayState> mapEventToState(
      CustomerLatePayEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case ToggleCheckBoxEvent:
        yield state.clone(
          checkBoxValue: (event as ToggleCheckBoxEvent).isSelected,
        );
        break;
      case SetDebtAmountEvent:
        yield state.clone(
          amount: (event as SetDebtAmountEvent).amount,
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
