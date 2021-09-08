import 'package:flutter/material.dart';

@immutable
class CustomerLatePayState {
  final String error;

  CustomerLatePayState({
    @required this.error,
  });

  static CustomerLatePayState get initialState => CustomerLatePayState(
        error: '',
      );

  CustomerLatePayState clone({
    String error,
  }) {
    return CustomerLatePayState(
      error: error ?? this.error,
    );
  }
}
