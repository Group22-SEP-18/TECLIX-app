import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:teclix/data/models/Product.dart';
import 'package:teclix/data/temporary/data.dart';

import 'customer_so_event.dart';
import 'customer_so_state.dart';

class CustomerSoBloc extends Bloc<CustomerSoEvent, CustomerSoState> {
  static List<CustomerSOProcessSteps> soProcessOrder = [
    CustomerSOProcessSteps.CUSTOMER_DETAILS,
    CustomerSOProcessSteps.SO_ADD_ITEMS,
    CustomerSOProcessSteps.SO_CART,
    CustomerSOProcessSteps.SO_INVOICE,
    CustomerSOProcessSteps.SO_PAY,
  ];
  CustomerSoBloc(BuildContext context) : super(CustomerSoState.initialState);

  Map<String, int> addToMap(Product product) {
    if (state.cart.containsKey(product.id)) {
      state.cart.update(product.id, (int) => state.cart[product.id] + 1);
      return state.cart;
    }
    state.cart[product.id] = 1;
    return state.cart;
  }

  Map<String, int> removeFromMap(Product product) {
    if (state.cart.containsKey(product.id) && state.cart[product.id] >= 1) {
      state.cart.update(product.id, (int) => state.cart[product.id] - 1);
    }

    return state.cart;
  }

  int getItemCount() {
    return state.cart.values.reduce((sum, element) => sum + element);
  }

  @override
  Stream<CustomerSoState> mapEventToState(CustomerSoEvent event) async* {
    switch (event.runtimeType) {
      case ErrorEvent:
        final error = (event as ErrorEvent).error;
        yield state.clone(error: "");
        yield state.clone(error: error);
        break;
      case NextStepEvent:
        final currentStep = (event as NextStepEvent).currentStep;
        final nextIndex = soProcessOrder.indexOf(currentStep) + 1;
        if (nextIndex < soProcessOrder.length) {
          yield state.clone(
            step: soProcessOrder[nextIndex],
          );
        } else {
          //  even to submit the order
        }
        break;

      case PreviousStepEvent:
        final currentStep = (event as PreviousStepEvent).currentStep;
        final prevIndex = soProcessOrder.indexOf(currentStep) - 1;
        final context = (event as PreviousStepEvent).context;
        if (prevIndex >= 0) {
          yield state.clone(
            step: soProcessOrder[prevIndex],
          );
        } else {
          Navigator.pop(context);
        }
        break;
      case ChangeFetchingVehicleItemEvent:
        yield state.clone(
          fetchingVehicleProducts:
              (event as ChangeFetchingVehicleItemEvent).isLoading,
        );
        break;
      case FetchVehicleItemsEvent:
        yield state.clone(fetchingVehicleProducts: true);
        // place hlder for backend call

        yield state.clone(
          fetchingVehicleProducts: false,
          vehicleItems: vehicleProd,
        );
        break;
      case AddToCartEvent:
        Product _product = (event as AddToCartEvent).product;

        yield state.clone(
          cart: addToMap(_product),
          itemCount: getItemCount(),
        );

        break;
      case RemoveFromCartEvent:
        Product _product = (event as RemoveFromCartEvent).product;

        yield state.clone(
          cart: removeFromMap(_product),
          itemCount: getItemCount(),
        );

        break;
      case ToggleCheckBoxEvent:
        yield state.clone(
          checkBoxValue: (event as ToggleCheckBoxEvent).isSelected,
        );
        break;
      case SetLoyaltyPointsEvent:
        yield state.clone(
          loyaltyPoints: (event as SetLoyaltyPointsEvent).amount,
        );
        break;
      case ToggleredeemEvent:
        yield state.clone(
          redeem: (event as ToggleredeemEvent).isSelected,
        );
        break;
      case SetBarcodeValueEvent:
        yield state.clone(barcodeVal: (event as SetBarcodeValueEvent).value);
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
