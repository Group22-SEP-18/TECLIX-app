import 'package:flutter/material.dart';
import 'package:teclix/data/models/Leaderboard.dart';

@immutable
class LeaderboardState {
  final String error;
  final bool loadingData;
  final List<Leaderboard> leaderboard;
  final int loggedUser;

  LeaderboardState({
    @required this.error,
    @required this.loadingData,
    @required this.leaderboard,
    @required this.loggedUser,
  });

  static LeaderboardState get initialState => LeaderboardState(
        error: '',
        loadingData: false,
        leaderboard: [],
        loggedUser: 0,
      );

  LeaderboardState clone({
    String error,
    bool loadingData,
    List<Leaderboard> leaderboard,
    int loggedUser,
  }) {
    return LeaderboardState(
      error: error ?? this.error,
      loadingData: loadingData ?? this.loadingData,
      leaderboard: leaderboard ?? this.leaderboard,
      loggedUser: loggedUser ?? this.loggedUser,
    );
  }
}
