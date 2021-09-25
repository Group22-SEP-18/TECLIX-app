import 'package:flutter/material.dart';
import 'package:teclix/data/models/Leaderboard.dart';

@immutable
class LeaderboardState {
  final String error;
  final bool loadingData;
  final List<Leaderboard> leaderboard;

  LeaderboardState({
    @required this.error,
    @required this.loadingData,
    @required this.leaderboard,
  });

  static LeaderboardState get initialState => LeaderboardState(
        error: '',
        loadingData: false,
        leaderboard: [],
      );

  LeaderboardState clone({
    String error,
    bool loadingData,
    List<Leaderboard> leaderboard,
  }) {
    return LeaderboardState(
      error: error ?? this.error,
      loadingData: loadingData ?? this.loadingData,
      leaderboard: leaderboard ?? this.leaderboard,
    );
  }
}
