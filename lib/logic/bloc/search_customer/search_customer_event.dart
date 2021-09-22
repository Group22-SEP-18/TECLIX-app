import 'package:flutter/material.dart';
import 'package:teclix/data/models/CustomerSearch.dart';

@immutable
abstract class SearchCustomerEvent {}

class ErrorEvent extends SearchCustomerEvent {
  final String error;

  ErrorEvent(this.error);
}

class ToggleLoadingEvent extends SearchCustomerEvent {
  final bool isLoading;

  ToggleLoadingEvent({this.isLoading});
}

class SubmitSearchEvent extends SearchCustomerEvent {
  final String value;

  SubmitSearchEvent({this.value});
}

class AddSelectedCustomer extends SearchCustomerEvent {
  final CustomerSearch selected;

  AddSelectedCustomer({this.selected});
}
