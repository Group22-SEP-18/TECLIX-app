import 'package:flutter/material.dart';

@immutable
class SalespersonProfileState {
  final String error;

  SalespersonProfileState({
    @required this.error,
  });

  static SalespersonProfileState get initialState => SalespersonProfileState(
        error: '',
      );

  SalespersonProfileState clone({
    String error,
  }) {
    return SalespersonProfileState(
      error: error ?? this.error,
    );
  }
}
