import 'package:flutter/material.dart';
import 'package:teclix/data/models/SalespersonVehicle.dart';
import 'package:teclix/data/models/Vehicle.dart';

@immutable
class SalespersonVehicleState {
  final String error;
  final bool loadingData;
  final SalespersonVehicle salespersonVehicle;
  final int totalItems;

  SalespersonVehicleState({
    @required this.error,
    @required this.loadingData,
    @required this.salespersonVehicle,
    @required this.totalItems,
  });

  static SalespersonVehicleState get initialState => SalespersonVehicleState(
      error: '',
      loadingData: false,
      salespersonVehicle: SalespersonVehicle(
        salesperson: 0,
        vehicle: Vehicle(),
        assignedVehicle: [],
      ),
      totalItems: 0);

  SalespersonVehicleState clone({
    String error,
    bool loadingData,
    SalespersonVehicle salespersonVehicle,
    int totalItems,
  }) {
    return SalespersonVehicleState(
      error: error ?? this.error,
      loadingData: loadingData ?? this.loadingData,
      salespersonVehicle: salespersonVehicle ?? this.salespersonVehicle,
      totalItems: totalItems ?? this.totalItems,
    );
  }
}
