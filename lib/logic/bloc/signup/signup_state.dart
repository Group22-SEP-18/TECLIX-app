import 'package:flutter/material.dart';

@immutable
class SignupState {
  final String error;

  SignupState({
    @required this.error,
  });

  static SignupState get initialState => SignupState(
        error: '',
      );

  SignupState clone({
    String error,
  }) {
    return SignupState(
      error: error ?? this.error,
    );
  }
}
