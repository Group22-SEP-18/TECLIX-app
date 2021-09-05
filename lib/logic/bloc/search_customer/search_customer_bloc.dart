import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'search_customer_event.dart';
import 'search_customer_state.dart';

class SearchCustomerBloc
    extends Bloc<SearchCustomerEvent, SearchCustomerState> {
  SearchCustomerBloc(BuildContext context)
      : super(SearchCustomerState.initialState);

  @override
  Stream<SearchCustomerState> mapEventToState(
      SearchCustomerEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case ToggleLoadingEvent:
        yield state.clone(
          loading: (event as ToggleLoadingEvent).isLoading,
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
