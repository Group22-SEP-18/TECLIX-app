import 'dart:io';

import 'package:flutter/material.dart';
import 'package:teclix/data/models/customer.dart';
import 'package:teclix/data/models/customer_location.dart';
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

class AddStoreDetailsEvent extends CustomerRegistrationEvent {
  final String storeName;
  final String email;
  final String contactNo;

  AddStoreDetailsEvent({this.storeName, this.email, this.contactNo});
}

class AddOwnerNameEvent extends CustomerRegistrationEvent {
  final String firstName;
  final String lastName;

  AddOwnerNameEvent({this.firstName, this.lastName});
}

class AddOwnerPictureEvent extends CustomerRegistrationEvent {
  final File profilePicture;

  AddOwnerPictureEvent({this.profilePicture});
}

class AddAddressEvent extends CustomerRegistrationEvent {
  final String street;
  final String city;
  final double lat;
  final double lang;
  final String district;

  AddAddressEvent({this.street, this.city, this.lat, this.lang, this.district});
}

class AddCustomerFinalAddressEvent extends CustomerRegistrationEvent {
  final CustomerLocation finalAddress;
  AddCustomerFinalAddressEvent({this.finalAddress});
}

class ChangeFetchingLoadingEvent extends CustomerRegistrationEvent {
  final bool isLoading;

  ChangeFetchingLoadingEvent({this.isLoading});
}

class SubmitRegisterEvent extends CustomerRegistrationEvent {
  final Customer customer;

  SubmitRegisterEvent({this.customer});
}
