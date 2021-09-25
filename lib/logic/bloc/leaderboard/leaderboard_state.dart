import 'package:flutter/material.dart';

@immutable
class LeaderboardState {
  final String error;

  LeaderboardState({
    @required this.error,
  });

  static LeaderboardState get initialState => LeaderboardState(
        error: '',
      );

  LeaderboardState clone({
    String error,
  }) {
    return LeaderboardState(
      error: error ?? this.error,
    );
  }
}
