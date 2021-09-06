import 'package:flutter/material.dart';

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
