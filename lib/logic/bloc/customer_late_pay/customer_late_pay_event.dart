import 'package:flutter/material.dart';

@immutable
abstract class CustomerLatePayEvent {}

class ErrorEvent extends CustomerLatePayEvent {
  final String error;

  ErrorEvent(this.error);
}

class SetDebtAmountEvent extends CustomerLatePayEvent {
  final double amount;

  SetDebtAmountEvent({this.amount});
}

class ToggleCheckBoxEvent extends CustomerLatePayEvent {
  final bool isSelected;

  ToggleCheckBoxEvent({this.isSelected});
}
