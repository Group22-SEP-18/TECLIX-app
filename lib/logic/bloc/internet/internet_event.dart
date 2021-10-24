import 'package:flutter/material.dart';
import 'package:teclix/logic/bloc/internet/internet_state.dart';

@immutable
abstract class InternetEvent {}

class ErrorEvent extends InternetEvent {
  final String error;

  ErrorEvent(this.error);
}

class ToggleConnectivity extends InternetEvent {
  final InternetConnection connection;

  ToggleConnectivity({this.connection});
}

class ToggleIntialChecking extends InternetEvent {
  final bool isInitial;

  ToggleIntialChecking({this.isInitial});
}
