import 'package:flutter/material.dart';

@immutable
class CustomerLatePayState {
  final String error;
  final String amount;
  final int customerId;
  final bool checkBoxValue;
  final bool loading;
  final bool paymentFailed;
  final bool paymentDone;

  CustomerLatePayState({
    @required this.error,
    @required this.amount,
    @required this.checkBoxValue,
    @required this.loading,
    @required this.paymentFailed,
    @required this.paymentDone,
    @required this.customerId,
  });

  static CustomerLatePayState get initialState => CustomerLatePayState(
        error: '',
        amount: '0.0',
        checkBoxValue: true,
        loading: false,
        paymentFailed: false,
        customerId: null,
        paymentDone: false,
      );

  CustomerLatePayState clone({
    String error,
    String amount,
    bool checkBoxValue,
    bool loading,
    bool paymentFailed,
    bool paymentDone,
    int customerId,
  }) {
    return CustomerLatePayState(
      error: error ?? this.error,
      amount: amount ?? this.amount,
      checkBoxValue: checkBoxValue ?? this.checkBoxValue,
      loading: loading ?? this.loading,
      paymentFailed: paymentFailed ?? this.paymentFailed,
      customerId: customerId ?? this.customerId,
      paymentDone: paymentDone ?? this.paymentDone,
    );
  }
}
