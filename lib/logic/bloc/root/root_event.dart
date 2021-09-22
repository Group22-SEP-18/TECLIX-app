import 'package:flutter/material.dart';
import 'package:teclix/logic/bloc/root/root_state.dart';

@immutable
abstract class RootEvent {}

class ErrorEvent extends RootEvent {
  final String error;

  ErrorEvent(this.error);
}

class LogInUserEvent extends RootEvent {
  final Map<String, String> credentials;
  final BuildContext buildContext;
  final showToast;

  LogInUserEvent({
    this.credentials,
    this.buildContext,
    this.showToast,
  });
}

class ChangeUerLoginStateEvent extends RootEvent {
  final UserLoginState userLoginState;

  ChangeUerLoginStateEvent({this.userLoginState});
}

class LogoutEvent extends RootEvent {
  final BuildContext buildContext;

  LogoutEvent({this.buildContext});
}
