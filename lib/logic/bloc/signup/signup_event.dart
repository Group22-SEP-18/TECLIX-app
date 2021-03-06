import 'dart:io';

import 'package:flutter/material.dart';
import 'package:teclix/data/models/salesperson.dart';
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
  final BuildContext context;
  final SignupProcessSteps currentStep;
  PreviousStepEvent({this.currentStep, this.context});
}

class AddEmployeeDetialsEvent extends SignupEvent {
  final String employeeNo;
  final String email;
  final String contactNo;

  AddEmployeeDetialsEvent({this.email, this.employeeNo, this.contactNo});
}

class AddNameEvent extends SignupEvent {
  final String firstName;
  final String lastName;

  AddNameEvent({this.firstName, this.lastName});
}

class AddPasswordEvent extends SignupEvent {
  final String password;

  AddPasswordEvent({this.password});
}

class AddProfilePictureEvent extends SignupEvent {
  final File profilePicture;

  AddProfilePictureEvent({this.profilePicture});
}

class SubmitUserEvent extends SignupEvent {
  final Salesperson salesperson;
  final BuildContext context;

  SubmitUserEvent({this.salesperson, this.context});
}

class ResetToInitialState extends SignupEvent {}
