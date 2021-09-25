import 'package:flutter/material.dart';

@immutable
abstract class SalespersonVehicleEvent {}

class ErrorEvent extends SalespersonVehicleEvent {
  final String error;

  ErrorEvent(this.error);
}
