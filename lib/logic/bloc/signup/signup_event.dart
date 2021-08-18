import 'package:flutter/material.dart';
import 'package:teclix/logic/bloc/signup/signup_state.dart';

@immutable
abstract class SignupEvent {}

class ErrorEvent extends SignupEvent {
  final String error;

  ErrorEvent(this.error);
}

class NextStepEvent extends SignupEvent {
  final SignupProcessSteps currentStep;
  NextStepEvent({this.currentStep});
}

class PreviousStepEvent extends SignupEvent {
  final SignupProcessSteps currentStep;
  PreviousStepEvent({this.currentStep});
}
