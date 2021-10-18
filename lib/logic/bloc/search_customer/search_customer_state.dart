import 'package:flutter/material.dart';
import 'package:teclix/data/models/customer_search.dart';

@immutable
class SearchCustomerState {
  final String error;
  final bool loading;
  final CustomerSearch selectedCus;
  final List<CustomerSearch> searchResult;

  SearchCustomerState({
    @required this.error,
    @required this.loading,
    @required this.selectedCus,
    @required this.searchResult,
  });

  static SearchCustomerState get initialState => SearchCustomerState(
        error: '',
        loading: false,
        selectedCus: null,
        searchResult: [],
      );

  SearchCustomerState clone({
    String error,
    bool loading,
    CustomerSearch selectedCus,
    List<CustomerSearch> searchResult,
  }) {
    return SearchCustomerState(
      error: error ?? this.error,
      loading: loading ?? this.loading,
      selectedCus: selectedCus ?? this.selectedCus,
      searchResult: searchResult ?? this.searchResult,
    );
  }
}
