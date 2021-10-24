import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'internet_event.dart';
import 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity;
  StreamSubscription connectivityStreamSubscription;
  InternetBloc(BuildContext context, this.connectivity)
      : super(InternetState.initialState) {
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.none) {
        add(ToggleConnectivity(connection: InternetConnection.DISCONNECTED));
      } else {
        add(ToggleConnectivity(connection: InternetConnection.CONNECTED));
      }
    });
  }

  @override
  Stream<InternetState> mapEventToState(InternetEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;

      case ToggleConnectivity:
        yield state.clone(
            status: (event as ToggleConnectivity).connection, error: '');
        break;

      case ToggleIntialChecking:
        yield state.clone(
            initialChecking: (event as ToggleIntialChecking).isInitial);
        break;
    }
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    _addErr(error);
    super.onError(error, stacktrace);
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

  @override
  Future<void> close() async {
    connectivityStreamSubscription.cancel();
    await super.close();
  }
}
