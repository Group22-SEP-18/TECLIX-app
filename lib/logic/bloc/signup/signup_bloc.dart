import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'signup_event.dart';
import 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(BuildContext context) : super(SignupState.initialState);

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
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
      add(ErrorEvent((e is String) ? e : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again!"));
    }
  }
}