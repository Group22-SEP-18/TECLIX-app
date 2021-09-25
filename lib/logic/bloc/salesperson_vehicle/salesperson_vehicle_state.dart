import 'package:flutter/material.dart';

@immutable
class SalespersonVehicleState {
  final String error;

  SalespersonVehicleState({
    @required this.error,
  });

  static SalespersonVehicleState get initialState => SalespersonVehicleState(
        error: '',
      );

  SalespersonVehicleState clone({
    String error,
  }) {
    return SalespersonVehicleState(
      error: error ?? this.error,
    );
  }
}
