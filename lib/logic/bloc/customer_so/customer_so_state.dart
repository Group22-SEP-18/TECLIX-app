import 'package:flutter/material.dart';
import 'package:teclix/data/models/AssignedVehicle.dart';
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
  final List<AssignedVehicle> vehicleItems;
  final Map<String, int> cart;
  final bool fetchingVehicleProducts;
  final double loyaltyPoints;
  final bool checkBoxValue;
  final bool redeem;
  final String barcodeVal;
  final double totalAmount;

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
    @required this.barcodeVal,
    @required this.totalAmount,
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
        barcodeVal: 'unknown',
        totalAmount: 0.00,
      );

  CustomerSoState clone({
    String error,
    CustomerSOProcessSteps step,
    int itemCount,
    List<AssignedVehicle> vehicleItems,
    Map<String, int> cart,
    bool fetchingVehicleProducts,
    double loyaltyPoints,
    bool checkBoxValue,
    bool redeem,
    String barcodeVal,
    double totalAmount,
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
      barcodeVal: barcodeVal ?? this.barcodeVal,
      totalAmount: totalAmount ?? this.totalAmount,
    );
  }
}
