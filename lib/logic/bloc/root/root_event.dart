import 'package:flutter/material.dart';

@immutable
abstract class RootEvent {}

class ErrorEvent extends RootEvent {
  final String error;

  ErrorEvent(this.error);
}

class LogInUserEvent extends RootEvent {
  final String email;
  final String password;

  LogInUserEvent({this.email, this.password});
}
