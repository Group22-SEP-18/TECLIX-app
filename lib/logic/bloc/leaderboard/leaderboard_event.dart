import 'package:flutter/material.dart';

@immutable
abstract class LeaderboardEvent {}

class ErrorEvent extends LeaderboardEvent {
  final String error;

  ErrorEvent(this.error);
}

class FetchLeaderboardEvent extends LeaderboardEvent {}
