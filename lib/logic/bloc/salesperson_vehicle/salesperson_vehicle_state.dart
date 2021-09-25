import 'package:flutter/material.dart';
import 'package:teclix/data/models/SalespersonVehicle.dart';

@immutable
class SalespersonVehicleState {
  final String error;
  final bool loadingData;
  final SalespersonVehicle salespersonVehicle;

  SalespersonVehicleState({
    @required this.error,
    @required this.loadingData,
    @required this.salespersonVehicle,
  });

  static SalespersonVehicleState get initialState => SalespersonVehicleState(
        error: '',
        loadingData: false,
        salespersonVehicle: SalespersonVehicle(),
      );

  SalespersonVehicleState clone({
    String error,
    bool loadingData,
    SalespersonVehicle salespersonVehicle,
  }) {
    return SalespersonVehicleState(
      error: error ?? this.error,
      loadingData: loadingData ?? this.loadingData,
      salespersonVehicle: salespersonVehicle ?? this.salespersonVehicle,
    );
  }
}
