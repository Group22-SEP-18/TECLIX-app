import 'package:flutter/material.dart';

@immutable
abstract class CustomerMainEvent {}

class ErrorEvent extends CustomerMainEvent {
  final String error;

  ErrorEvent(this.error);
}

class FetchDailyStatEvent extends CustomerMainEvent {}
