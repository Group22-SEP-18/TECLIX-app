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

  CustomerSoState({
    @required this.error,
    @required this.step,
  });

  static CustomerSoState get initialState => CustomerSoState(
        error: '',
        step: CustomerSoBloc.soProcessOrder[0],
      );

  CustomerSoState clone({String error, CustomerSOProcessSteps step}) {
    return CustomerSoState(
      error: error ?? this.error,
      step: step ?? this.step,
    );
  }
}
