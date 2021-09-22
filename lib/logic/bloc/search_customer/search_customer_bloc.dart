import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teclix/data/services/search_customer_service.dart';

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
        break;
      case SubmitSearchEvent:
        yield state.clone(loading: true);
        final value = (event as SubmitSearchEvent).value;
        var prefs = await SharedPreferences.getInstance();
        String token = (prefs.getString('token') ?? '');
        final response = await SearchCustomerService.searchCustomer(
            token: token, value: value);
        yield state.clone(loading: false);

        if (response[1].toString() == '200') {
          yield state.clone(searchResult: response[0]);
        } else {
          print(response);
        }
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
