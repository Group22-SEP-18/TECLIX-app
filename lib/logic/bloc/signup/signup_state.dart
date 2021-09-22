import 'package:flutter/material.dart';
import 'package:teclix/data/models/Salesperson.dart';
import 'package:teclix/logic/bloc/signup/signup_bloc.dart';

enum SignupProcessSteps {
  SIGNUP_START,
  SIGNUP_EMP_DETAILS,
  SIGNUP_BASIC_DETAILS,
  SIGNUP_PASSWORD,
  SIGNUP_PROFILE_PICTURE,
  SIGNUP_FINISH,
}

@immutable
class SignupState {
  final String error;
  final SignupProcessSteps step;
  final Salesperson salesperson;
  final double flowPosition;
  final bool loading;
  final bool registeredSucessfully;

  SignupState({
    @required this.error,
    @required this.salesperson,
    @required this.step,
    @required this.flowPosition,
    @required this.loading,
    @required this.registeredSucessfully,
  });

  static SignupState get initialState => SignupState(
        error: '',
        step: SignupBloc.processOrder[0],
        salesperson: Salesperson(),
        flowPosition: 0,
        loading: false,
        registeredSucessfully: false,
      );

  SignupState clone({
    String error,
    SignupProcessSteps step,
    Salesperson salesperson,
    double flowPosition,
    bool loading,
    bool registeredSucessfully,
  }) {
    return SignupState(
      error: error ?? this.error,
      step: step ?? this.step,
      salesperson: salesperson ?? this.salesperson,
      flowPosition: flowPosition ?? this.flowPosition,
      loading: loading ?? this.loading,
      registeredSucessfully:
          registeredSucessfully ?? this.registeredSucessfully,
    );
  }
}
