import 'package:flutter/material.dart';
import 'package:teclix/data/models/salesperson.dart';

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
  final bool logoutFailed;
  final String loginError;

  final bool loading;
  // final bool

  RootState({
    @required this.error,
    @required this.userLoginState,
    @required this.loggedUser,
    @required this.loading,
    @required this.loginFailed,
    @required this.logoutFailed,
    @required this.loginError,
  });

  static RootState get initialState => RootState(
        error: '',
        userLoginState: UserLoginState.CHECKING,
        loggedUser: null,
        loading: false,
        loginFailed: false,
        logoutFailed: false,
        loginError: null,
      );

  RootState clone({
    String error,
    Salesperson loggedUser,
    UserLoginState userLoginState,
    bool loading,
    bool loginFailed,
    bool logoutFailed,
    String loginError,
  }) {
    return RootState(
      error: error ?? this.error,
      loggedUser: loggedUser ?? this.loggedUser,
      userLoginState: userLoginState ?? this.userLoginState,
      loading: loading ?? this.loading,
      loginFailed: loginFailed ?? this.loginFailed,
      logoutFailed: logoutFailed ?? this.logoutFailed,
      loginError: loginError ?? this.loginError,
    );
  }
}
