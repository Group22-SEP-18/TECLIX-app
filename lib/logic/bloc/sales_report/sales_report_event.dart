import 'package:flutter/material.dart';

@immutable
abstract class SalesReportEvent {}

class ErrorEvent extends SalesReportEvent {
  final String error;

  ErrorEvent(this.error);
}

class FetchReportData extends SalesReportEvent {}
