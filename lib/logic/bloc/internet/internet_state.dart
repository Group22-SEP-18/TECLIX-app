import 'package:flutter/material.dart';

enum InternetConnection { CONNECTED, DISCONNECTED }

@immutable
class InternetState {
  final String error;
  final InternetConnection status;
  final bool initialChecking;

  InternetState({
    @required this.error,
    @required this.status,
    @required this.initialChecking,
  });

  static InternetState get initialState => InternetState(
        error: '',
        status: InternetConnection.DISCONNECTED,
        initialChecking: true,
      );

  InternetState clone(
      {String error, InternetConnection status, bool initialChecking}) {
    return InternetState(
      error: error ?? this.error,
      status: status ?? this.status,
      initialChecking: initialChecking ?? this.initialChecking,
    );
  }
}
