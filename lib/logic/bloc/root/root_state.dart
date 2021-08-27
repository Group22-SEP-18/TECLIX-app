import 'package:flutter/material.dart';

@immutable
class RootState {
  final String error;

  RootState({
    @required this.error,
  });

  static RootState get initialState => RootState(
        error: '',
      );

  RootState clone({
    String error,
  }) {
    return RootState(
      error: error ?? this.error,
    );
  }
}
