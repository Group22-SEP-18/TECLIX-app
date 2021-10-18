import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teclix/data/models/assigned_vehicle.dart';
import 'package:teclix/data/models/order_item.dart';
import 'package:teclix/data/models/product.dart';
import 'package:teclix/data/models/service_order.dart';
import 'package:teclix/data/services/asset_vehicle_service.dart';
import 'package:teclix/data/services/so_service.dart';

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

  List<OrderItems> maptoOrderItems() {
    AssignedVehicle p;
    List<OrderItems> list = [];
    state.cart.entries.map((e) {
      p = AssignedVehicle.getByProductId(e.key, state.vehicleItems);
      list.add(OrderItems(
          product: int.parse(p.product.id),
          priceAtTheTime: p.product.price.toString(),
          quantity: e.value));
    }).toList();
    return list;
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
        var prefs = await SharedPreferences.getInstance();
        final token = (prefs.getString('token') ?? '');
        var response =
            await AssetVehicleService.fetchVehicleProducts(token: token);
        yield state.clone(
          fetchingVehicleProducts: false,
          vehicleItems: response,
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
      case SetTotalAmount:
        yield state.clone(totalAmount: (event as SetTotalAmount).amount);
        break;
      case SetCustomerId:
        yield state.clone(customerId: (event as SetCustomerId).id);
        break;
      case CreateLatePaySo:
        yield state.clone(postingSo: true);
        var prefs = await SharedPreferences.getInstance();
        final token = (prefs.getString('token') ?? '');
        final ServiceOrder so = ServiceOrder(
            customer: state.customerId,
            discount: '0.00',
            orderItems: maptoOrderItems(),
            originalPrice: state.totalAmount.toString(),
            soType: 'later');
        var response =
            await SoService.createSo(token: token, data: so.toJson());
        yield state.clone(postingSo: false);
        if (response == '201') {
          yield state.clone(postingFailed: false, postingDone: true);
        } else {
          yield state.clone(postingFailed: true, postingDone: false);
        }
        break;
      case CreateSo:
        yield state.clone(postingSo: true);
        var prefs = await SharedPreferences.getInstance();
        final token = (prefs.getString('token') ?? '');
        final ServiceOrder so = ServiceOrder(
            customer: state.customerId,
            discount: state.loyaltyPoints.toString(),
            orderItems: maptoOrderItems(),
            originalPrice: state.totalAmount.toString(),
            soType: 'now');
        var response =
            await SoService.createSo(token: token, data: so.toJson());
        yield state.clone(postingSo: false);
        if (response == '201') {
          yield state.clone(postingFailed: false, postingDone: true);
        } else {
          yield state.clone(postingFailed: true, postingDone: false);
        }
        break;
      case AddSelectedItem:
        yield state.clone(scannedProduct: (event as AddSelectedItem).product);
        break;
      case ChangeVehicleList:
        yield state.clone(
          vehicleItems: (event as ChangeVehicleList).list,
        );
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
