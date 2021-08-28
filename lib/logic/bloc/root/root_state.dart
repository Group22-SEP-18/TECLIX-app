import 'package:flutter/material.dart';
import 'package:teclix/data/models/Salesperson.dart';

enum UserLoginState {
  LOGGED_IN,
  lOGGED_OUT,
  CHECKING,
}

@immutable
class RootState {
  final String error;
  final UserLoginState userLoginState;
  final Salesperson loggedUser;

  RootState({
    @required this.error,
    @required this.userLoginState,
    @required this.loggedUser,
  });

  static RootState get initialState => RootState(
        error: '',
        userLoginState: UserLoginState.CHECKING,
        loggedUser: null,
      );

  RootState clone({
    String error,
    Salesperson loggedUser,
    UserLoginState userLoginState,
  }) {
    return RootState(
      error: error ?? this.error,
      loggedUser: loggedUser ?? this.loggedUser,
      userLoginState: userLoginState ?? this.userLoginState,
    );
  }
}
