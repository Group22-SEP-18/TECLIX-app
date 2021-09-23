import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teclix/data/services/customer_late_pay_service.dart';

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
      case SetSelctedCustomerEvent:
        yield state.clone(
          customerId: (event as SetSelctedCustomerEvent).customerId,
          amount: (event as SetSelctedCustomerEvent).amount,
        );
        break;
      case SubmitLatePayEvent:
        yield state.clone(loading: true);
        final data = (event as SubmitLatePayEvent).data;
        var prefs = await SharedPreferences.getInstance();
        String token = (prefs.getString('token') ?? '');
        final response =
            await CustomerLatePayService.addLatePay(data: data, token: token);
        yield state.clone(loading: false);
        if (response == '201') {
          yield state.clone(
            paymentFailed: false,
            paymentDone: true,
          );
        } else {
          yield state.clone(
            paymentFailed: true,
            paymentDone: false,
          );
        }
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
