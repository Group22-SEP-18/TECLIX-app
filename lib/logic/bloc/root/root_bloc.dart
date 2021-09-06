import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

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
        final email = (event as LogInUserEvent).email;
        final password = (event as LogInUserEvent).password;

        //:TODO call the login function
        // if sucessful do this
        yield state.clone(
          userLoginState: UserLoginState.LOGGED_IN, loading: false,
          // :TODO clone the user obj as well
        );
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
