import 'package:flutter/material.dart';
import 'package:teclix/data/models/DailyStats.dart';

@immutable
class CustomerMainState {
  final String error;
  final bool loadingData;
  final DailyStats dailyStats;

  CustomerMainState({
    @required this.error,
    @required this.loadingData,
    @required this.dailyStats,
  });

  static CustomerMainState get initialState => CustomerMainState(
        error: '',
        loadingData: false,
        dailyStats: DailyStats(),
      );

  CustomerMainState clone({
    String error,
    bool loadingData,
    DailyStats dailyStats,
  }) {
    return CustomerMainState(
      error: error ?? this.error,
      loadingData: loadingData ?? this.loadingData,
      dailyStats: dailyStats ?? this.dailyStats,
    );
  }
}
