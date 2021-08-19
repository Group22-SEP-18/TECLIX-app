import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  static List<SignupProcessSteps> processOrder = [
    SignupProcessSteps.SIGNUP_START,
    SignupProcessSteps.SIGNUP_EMP_DETAILS,
    SignupProcessSteps.SIGNUP_BASIC_DETAILS,
    SignupProcessSteps.SIGNUP_PASSWORD,
    SignupProcessSteps.SIGNUP_PROFILE_PICTURE,
    SignupProcessSteps.SIGNUP_FINISH,
  ];
  SignupBloc(BuildContext context) : super(SignupState.initialState);

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
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
            flowPosition: nextIndex.toDouble(),
          );
        } else {
          //  even to submit the regiter form
        }
        break;

      case PreviousStepEvent:
        final currentStep = (event as PreviousStepEvent).currentStep;
        final prevIndex = processOrder.indexOf(currentStep) - 1;
        if (prevIndex >= 0) {
          yield state.clone(
            step: processOrder[prevIndex],
            flowPosition: prevIndex.toDouble(),
          );
        } else {
          // when it reaches the first back btn
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
