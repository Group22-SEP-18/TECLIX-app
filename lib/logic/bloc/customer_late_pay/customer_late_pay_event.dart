import 'package:flutter/material.dart';

@immutable
abstract class CustomerLatePayEvent {}

class ErrorEvent extends CustomerLatePayEvent {
  final String error;

  ErrorEvent(this.error);
}

class SetSelctedCustomerEvent extends CustomerLatePayEvent {
  final String amount;
  final int customerId;

  SetSelctedCustomerEvent({this.amount, this.customerId});
}

class SetDebtAmountEvent extends CustomerLatePayEvent {
  final String amount;

  SetDebtAmountEvent({this.amount});
}

class ToggleCheckBoxEvent extends CustomerLatePayEvent {
  final bool isSelected;

  ToggleCheckBoxEvent({this.isSelected});
}

class SubmitLatePayEvent extends CustomerLatePayEvent {
  final Map<String, dynamic> data;

  SubmitLatePayEvent({this.data});
}
