import 'package:flutter/material.dart';

@immutable
abstract class CustomerLatePayEvent {}

class ErrorEvent extends CustomerLatePayEvent {
  final String error;

  ErrorEvent(this.error);
}
