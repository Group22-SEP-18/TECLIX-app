import 'package:flutter/material.dart';

@immutable
class CustomerMainState {
  final String error;

  CustomerMainState({
    @required this.error,
  });

  static CustomerMainState get initialState => CustomerMainState(
        error: '',
      );

  CustomerMainState clone({
    String error,
  }) {
    return CustomerMainState(
      error: error ?? this.error,
    );
  }
}
