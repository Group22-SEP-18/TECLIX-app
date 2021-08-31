import 'package:flutter/material.dart';
import 'package:teclix/data/models/Customer.dart';
import 'package:teclix/data/models/CustomerLocation.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_bloc.dart';

enum CustomerRegProcessSteps {
  CUSTOMER_REG_START,
  CUSTOMER_REG_STORE_DETAILS,
  CUSTOMER_REG_OWNER_DETAILS,
  CUSTOMER_REG_ADDRESS,
  CUSTOMER_REG_FINISH,
}

@immutable
class CustomerRegistrationState {
  final String error;
  final CustomerRegProcessSteps step;
  final Customer customer;
  final CustomerLocation storeAddress;
  final bool fetchingLocation;

  CustomerRegistrationState({
    @required this.error,
    @required this.step,
    @required this.customer,
    @required this.storeAddress,
    @required this.fetchingLocation,
  });

  static CustomerRegistrationState get initialState =>
      CustomerRegistrationState(
        error: '',
        step: CustomerRegistrationBloc.processOrder[0],
        customer: Customer(),
        storeAddress: CustomerLocation(),
        fetchingLocation: false,
      );

  CustomerRegistrationState clone({
    String error,
    CustomerRegProcessSteps step,
    Customer customer,
    CustomerLocation storeAddress,
    bool fetchingLocation,
  }) {
    return CustomerRegistrationState(
      error: error ?? this.error,
      step: step ?? this.step,
      customer: customer ?? this.customer,
      storeAddress: storeAddress ?? this.storeAddress,
      fetchingLocation: fetchingLocation ?? this.fetchingLocation,
    );
  }
}
