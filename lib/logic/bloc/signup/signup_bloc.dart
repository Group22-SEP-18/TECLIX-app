import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teclix/data/services/auth_service.dart';

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
        } else {}
        break;

      case PreviousStepEvent:
        final currentStep = (event as PreviousStepEvent).currentStep;
        final prevIndex = processOrder.indexOf(currentStep) - 1;
        final context = (event as PreviousStepEvent).context;
        if (prevIndex >= 0) {
          yield state.clone(
            step: processOrder[prevIndex],
            flowPosition: prevIndex.toDouble(),
          );
        } else {
          Navigator.pop(context);
        }
        break;
      case AddEmployeeDetialsEvent:
        yield state.clone(
          salesperson: state.salesperson.copyWith(
            email: (event as AddEmployeeDetialsEvent).email,
            employeeNo: (event as AddEmployeeDetialsEvent).employeeNo,
            contactNo: (event as AddEmployeeDetialsEvent).contactNo,
          ),
        );
        break;
      case AddNameEvent:
        yield state.clone(
          salesperson: state.salesperson.copyWith(
            firstName: (event as AddNameEvent).firstName,
            lastName: (event as AddNameEvent).lastName,
          ),
        );
        break;
      case AddPasswordEvent:
        yield state.clone(
          salesperson: state.salesperson.copyWith(
            password: (event as AddPasswordEvent).password,
          ),
        );
        break;
      case AddProfilePictureEvent:
        yield state.clone(
          salesperson: state.salesperson.copyWith(
            profilePicture: (event as AddProfilePictureEvent).profilePicture,
          ),
        );
        break;
      case SubmitUserEvent:
        yield state.clone(loading: true);
        final salesperson = (event as SubmitUserEvent).salesperson;

        final response = await AuthService.registerUser(salesperson);
        yield state.clone(
          loading: false,
        );

        if (response == '201') {
          yield state.clone(
            registeredSucessfully: true,
          );
        } else {
          yield state.clone(
            registeredSucessfully: false,
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
