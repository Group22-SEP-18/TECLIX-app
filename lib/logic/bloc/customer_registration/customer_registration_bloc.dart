import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'customer_registration_event.dart';
import 'customer_registration_state.dart';

class CustomerRegistrationBloc
    extends Bloc<CustomerRegistrationEvent, CustomerRegistrationState> {
  static List<CustomerRegProcessSteps> processOrder = [
    CustomerRegProcessSteps.CUSTOMER_REG_START,
    CustomerRegProcessSteps.CUSTOMER_REG_STORE_DETAILS,
    CustomerRegProcessSteps.CUSTOMER_REG_OWNER_DETAILS,
    CustomerRegProcessSteps.CUSTOMER_REG_ADDRESS,
    CustomerRegProcessSteps.CUSTOMER_REG_FINISH,
  ];

  CustomerRegistrationBloc(BuildContext context)
      : super(CustomerRegistrationState.initialState);

  @override
  Stream<CustomerRegistrationState> mapEventToState(
      CustomerRegistrationEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case NextStepEvent:
        final currentStep = (event as NextStepEvent).currentStep;
        final nextIndex = processOrder.indexOf(currentStep) + 1;
        if (nextIndex < processOrder.length) {
          yield state.clone(
            step: processOrder[nextIndex],
          );
        } else {
          //  even to submit the regiter form
        }
        break;

      case PreviousStepEvent:
        final currentStep = (event as PreviousStepEvent).currentStep;
        final prevIndex = processOrder.indexOf(currentStep) - 1;
        final context = (event as PreviousStepEvent).context;
        if (prevIndex >= 0) {
          yield state.clone(
            step: processOrder[prevIndex],
          );
        } else {
          Navigator.pop(context);
        }
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
