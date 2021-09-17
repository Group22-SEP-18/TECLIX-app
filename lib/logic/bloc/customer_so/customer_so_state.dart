import 'package:flutter/material.dart';
import 'package:teclix/data/models/Product.dart';
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
  final List<Product> vehicleItems;
  final Map<String, int> cart;
  final bool fetchingVehicleProducts;
  final double loyaltyPoints;
  final bool checkBoxValue;
  final bool redeem;

  CustomerSoState({
    @required this.error,
    @required this.step,
    @required this.itemCount,
    @required this.vehicleItems,
    @required this.cart,
    @required this.fetchingVehicleProducts,
    @required this.loyaltyPoints,
    @required this.checkBoxValue,
    @required this.redeem,
  });

  static CustomerSoState get initialState => CustomerSoState(
        error: '',
        step: CustomerSoBloc.soProcessOrder[0],
        itemCount: 0,
        vehicleItems: [],
        cart: Map(),
        fetchingVehicleProducts: false,
        //: TODO change the value to zero later
        loyaltyPoints: 150.00,
        checkBoxValue: true,
        redeem: false,
      );

  CustomerSoState clone({
    String error,
    CustomerSOProcessSteps step,
    int itemCount,
    List<Product> vehicleItems,
    Map<String, int> cart,
    bool fetchingVehicleProducts,
    double loyaltyPoints,
    bool checkBoxValue,
    bool redeem,
  }) {
    return CustomerSoState(
      error: error ?? this.error,
      step: step ?? this.step,
      itemCount: itemCount ?? this.itemCount,
      vehicleItems: vehicleItems ?? this.vehicleItems,
      cart: cart ?? this.cart,
      fetchingVehicleProducts:
          fetchingVehicleProducts ?? this.fetchingVehicleProducts,
      checkBoxValue: checkBoxValue ?? this.checkBoxValue,
      loyaltyPoints: loyaltyPoints ?? this.loyaltyPoints,
      redeem: redeem ?? this.redeem,
    );
  }
}
