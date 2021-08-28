import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'root_event.dart';
import 'root_state.dart';

class RootBloc extends Bloc<RootEvent, RootState> {
  RootBloc(BuildContext context) : super(RootState.initialState);

  @override
  Stream<RootState> mapEventToState(RootEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;

      case LogInUserEvent:
        final email = (event as LogInUserEvent).email;
        final password = (event as LogInUserEvent).password;

        print(email);
        //:TODO call the login function
        // if sucessful do this
        yield state.clone(
          userLoginState: UserLoginState.LOGGED_IN,
          // :TODO clone the user obj as well
        );
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
