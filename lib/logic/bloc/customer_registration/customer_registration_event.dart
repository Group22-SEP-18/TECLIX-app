import 'package:flutter/material.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_state.dart';

@immutable
abstract class CustomerRegistrationEvent {}

class ErrorEvent extends CustomerRegistrationEvent {
  final String error;

  ErrorEvent(this.error);
}

class NextStepEvent extends CustomerRegistrationEvent {
  final CustomerRegProcessSteps currentStep;
  NextStepEvent({this.currentStep});
}

class PreviousStepEvent extends CustomerRegistrationEvent {
  final BuildContext context;
  final CustomerRegProcessSteps currentStep;
  PreviousStepEvent({this.currentStep, this.context});
}
