import 'package:flutter/material.dart';

@immutable
abstract class SignupEvent {}

class ErrorEvent extends SignupEvent {
  final String error;

  ErrorEvent(this.error);
}
