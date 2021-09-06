import 'package:flutter/material.dart';

@immutable
class SearchCustomerState {
  final String error;
  final bool loading;

  SearchCustomerState({
    @required this.error,
    @required this.loading,
  });

  static SearchCustomerState get initialState => SearchCustomerState(
        error: '',
        loading: false,
      );

  SearchCustomerState clone({
    String error,
    bool loading,
  }) {
    return SearchCustomerState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
    );
  }
}
