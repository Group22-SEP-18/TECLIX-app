import 'package:flutter/material.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_state.dart';

@immutable
abstract class CustomerSoEvent {}

class ErrorEvent extends CustomerSoEvent {
  final String error;

  ErrorEvent(this.error);
}

class NextStepEvent extends CustomerSoEvent {
  final CustomerSOProcessSteps currentStep;
  NextStepEvent({this.currentStep});
}

class PreviousStepEvent extends CustomerSoEvent {
  final BuildContext context;
  final CustomerSOProcessSteps currentStep;
  PreviousStepEvent({this.currentStep, this.context});
}
