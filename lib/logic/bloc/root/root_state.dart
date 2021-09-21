import 'package:flutter/material.dart';
import 'package:teclix/data/models/Salesperson.dart';

enum UserLoginState {
  LOGGED_IN,
  LOGGED_OUT,
  CHECKING,
}

@immutable
class RootState {
  final String error;
  final UserLoginState userLoginState;
  final Salesperson loggedUser;
  final bool loginFailed;
  final bool loading;

  RootState({
    @required this.error,
    @required this.userLoginState,
    @required this.loggedUser,
    @required this.loading,
    @required this.loginFailed,
  });

  static RootState get initialState => RootState(
        error: '',
        userLoginState: UserLoginState.CHECKING,
        loggedUser: null,
        loading: false,
        loginFailed: false,
      );

  RootState clone({
    String error,
    Salesperson loggedUser,
    UserLoginState userLoginState,
    bool loading,
    bool loginFailed,
  }) {
    return RootState(
      error: error ?? this.error,
      loggedUser: loggedUser ?? this.loggedUser,
      userLoginState: userLoginState ?? this.userLoginState,
      loading: loading ?? this.loading,
      loginFailed: loginFailed ?? this.loginFailed,
    );
  }
}
