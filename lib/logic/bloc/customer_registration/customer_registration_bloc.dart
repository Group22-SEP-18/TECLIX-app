import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teclix/data/models/customer.dart';
import 'package:teclix/data/services/customer_register_service.dart';

import 'customer_registration_event.dart';
import 'customer_registration_state.dart';

class CustomerRegistrationBloc
    extends Bloc<CustomerRegistrationEvent, CustomerRegistrationState> {
  static List<CustomerRegProcessSteps> processOrder = [
    CustomerRegProcessSteps.CUSTOMER_REG_START,
    CustomerRegProcessSteps.CUSTOMER_REG_STORE_DETAILS,
    CustomerRegProcessSteps.CUSTOMER_REG_OWNER_DETAILS,
    CustomerRegProcessSteps.CUSTOMER_REG_ADDRESS,
    CustomerRegProcessSteps.CUSTOMER_REG_FINISH,
  ];

  CustomerRegistrationBloc(BuildContext context)
      : super(CustomerRegistrationState.initialState);

  @override
  Stream<CustomerRegistrationState> mapEventToState(
      CustomerRegistrationEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case NextStepEvent:
        final currentStep = (event as NextStepEvent).currentStep;
        final nextIndex = processOrder.indexOf(currentStep) + 1;
        if (nextIndex < processOrder.length) {
          yield state.clone(
            step: processOrder[nextIndex],
          );
        } else {
          //  even to submit the regiter form
        }
        break;

      case PreviousStepEvent:
        final currentStep = (event as PreviousStepEvent).currentStep;
        final prevIndex = processOrder.indexOf(currentStep) - 1;
        final context = (event as PreviousStepEvent).context;
        if (prevIndex >= 0) {
          yield state.clone(
            step: processOrder[prevIndex],
          );
        } else {
          Navigator.pop(context);
        }
        break;
      case AddStoreDetailsEvent:
        yield state.clone(
            customer: state.customer.copyWith(
          shopName: (event as AddStoreDetailsEvent).storeName,
          email: (event as AddStoreDetailsEvent).email,
          contactNo: (event as AddStoreDetailsEvent).contactNo,
        ));
        break;
      case AddOwnerNameEvent:
        yield state.clone(
            customer: state.customer.copyWith(
          ownerFistName: (event as AddOwnerNameEvent).firstName,
          ownerLastName: (event as AddOwnerNameEvent).lastName,
        ));
        break;
      case AddOwnerPictureEvent:
        yield state.clone(
            customer: state.customer.copyWith(
          profilePicture: (event as AddOwnerPictureEvent).profilePicture,
        ));
        break;
      case AddAddressEvent:
        yield state.clone(
          storeAddress: state.storeAddress.copyWith(
            city: (event as AddAddressEvent).city,
            street: (event as AddAddressEvent).street,
            district: (event as AddAddressEvent).district,
            latitude: (event as AddAddressEvent).lat,
            longitude: (event as AddAddressEvent).lang,
          ),
        );
        break;
      case ChangeFetchingLoadingEvent:
        yield state.clone(
          fetchingLocation: (event as ChangeFetchingLoadingEvent).isLoading,
        );
        break;
      case AddCustomerFinalAddressEvent:
        yield state.clone(
            customer: state.customer.copyWith(
          address: (event as AddCustomerFinalAddressEvent).finalAddress,
        ));
        break;
      case SubmitRegisterEvent:
        yield state.clone(
          loading: true,
          registerErr: '',
        );
        var prefs = await SharedPreferences.getInstance();
        String token = (prefs.getString('token') ?? '');
        final cus = (event as SubmitRegisterEvent).customer;
        final response = await CustomerRegisterService.registerCustomer(
            customer: cus, token: token);
        yield state.clone(
          loading: false,
        );
        if (response == '201') {
          yield state.clone(
              registerDone: true, registerErr: '', customer: Customer());
        } else {
          yield state.clone(
            registerDone: false,
            registerErr: response,
          );
        }

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
      add(ErrorEvent((e is String)
          ? e
          : (e.message ?? "Something went wrong. Please try again!")));
    } catch (e) {
      add(ErrorEvent("Something went wrong. Please try again!"));
    }
  }
}
