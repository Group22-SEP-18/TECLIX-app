import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teclix/data/models/Salesperson.dart';
import 'package:teclix/data/services/auth_service.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/toast_message.dart';

import 'root_event.dart';
import 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc(BuildContext context) : super(RootState.initialState) {
    _initialize();
  }

  Future<void> _initialize() async {
    //TODO: init sign in automatically when app starts
    // Get email and password from shared prefs?
    // final auth = locator<AuthService>();
    // User user = await auth.createUserWithEmailAndPassword(email, password);
    add(ChangeUerLoginStateEvent(userLoginState: UserLoginState.LOGGED_OUT));
  }

  @override
  Stream<RootState> mapEventToState(RootEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;

      case ChangeUerLoginStateEvent:
        UserLoginState userLoginState =
            (event as ChangeUerLoginStateEvent).userLoginState;
        yield state.clone(userLoginState: userLoginState);
        break;

      case LogInUserEvent:
        yield state.clone(
          loading: true,
        );
        final cred = (event as LogInUserEvent).credentials;
        final response = await AuthService.loginUser(cred);

        if (response.containsKey('data')) {
          var prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', response['data']['token']);

          yield state.clone(
            loggedUser: Salesperson.fromJson(response['data']),
            loginFailed: false,
            userLoginState: UserLoginState.LOGGED_IN,
            loading: false,
          );
        } else if (response.containsKey('error')) {
          yield state.clone(
            loginFailed: true,
            loading: false,
          );
          showToast(
            isError: true,
            iconSize: 40,
            height: 60.0,
            color: ColorToastRed,
            text: response['error']['detail'],
            context: (event as LogInUserEvent).buildContext,
            durationInSec: 5,
          );
        }

        // if sucessful do this

        break;
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
