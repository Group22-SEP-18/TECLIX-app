import 'package:flutter/material.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_bloc.dart';

enum CustomerSOProcessSteps {
  CUSTOMER_DETAILS,
  SO_ADD_ITEMS,
  SO_CART,
  SO_INVOICE,
  SO_PAY,
}

@immutable
class CustomerSoState {
  final String error;
  final CustomerSOProcessSteps step;
  final int itemCount;

  CustomerSoState({
    @required this.error,
    @required this.step,
    @required this.itemCount,
  });

  static CustomerSoState get initialState => CustomerSoState(
        error: '',
        step: CustomerSoBloc.soProcessOrder[0],
        itemCount: 0,
      );

  CustomerSoState clone({
    String error,
    CustomerSOProcessSteps step,
    int itemCount,
  }) {
    return CustomerSoState(
      error: error ?? this.error,
      step: step ?? this.step,
      itemCount: itemCount ?? this.itemCount,
    );
  }
}
