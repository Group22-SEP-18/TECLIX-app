import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teclix/data/services/leaderboard_service.dart';

import 'leaderboard_event.dart';
import 'leaderboard_state.dart';

class LeaderboardBloc extends Bloc<LeaderboardEvent, LeaderboardState> {
  LeaderboardBloc(BuildContext context) : super(LeaderboardState.initialState) {
    _initialize(context);
  }

  Future<void> _initialize(context) async {
    add(FetchLeaderboardEvent());
  }

  @override
  Stream<LeaderboardState> mapEventToState(LeaderboardEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case FetchLeaderboardEvent:
        yield state.clone(loadingData: true);
        var prefs = await SharedPreferences.getInstance();
        final token = (prefs.getString('token') ?? '');
        final id = (prefs.getString('id') ?? '');

        var response = await LeaderboardService.fetchLeaderboard(token: token);
        yield state.clone(
            loadingData: false,
            leaderboard: response,
            loggedUser: int.parse(id));
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    _addErr(error);
    super.onError(error, stacktrace);
  }

  @override
  Future<void> close() async {
    await super.close();
  }

  void _addErr(e) {
    if (e is StateError) return;
    try {
      add(ErrorEvent((e is String)
          ? e
          : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again!"));
    }
  }
}
