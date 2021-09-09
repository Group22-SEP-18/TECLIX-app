import 'package:flutter/material.dart';

@immutable
class CustomerLatePayState {
  final String error;
  final double amount;
  final bool checkBoxValue;

  CustomerLatePayState({
    @required this.error,
    @required this.amount,
    @required this.checkBoxValue,
  });

  static CustomerLatePayState get initialState => CustomerLatePayState(
        error: '',
        amount: 0.0,
        checkBoxValue: true,
      );

  CustomerLatePayState clone({
    String error,
    double amount,
    bool checkBoxValue,
  }) {
    return CustomerLatePayState(
      error: error ?? this.error,
      amount: amount ?? this.amount,
      checkBoxValue: checkBoxValue ?? this.checkBoxValue,
    );
  }
}
