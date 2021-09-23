import 'package:flutter/material.dart';

@immutable
abstract class SalespersonProfileEvent {}

class ErrorEvent extends SalespersonProfileEvent {
  final String error;

  ErrorEvent(this.error);
}
