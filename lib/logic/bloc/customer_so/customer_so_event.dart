import 'package:flutter/material.dart';
import 'package:teclix/data/models/AssignedVehicle.dart';
import 'package:teclix/data/models/Product.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_state.dart';

@immutable
abstract class CustomerSoEvent {}

class ErrorEvent extends CustomerSoEvent {
  final String error;

  ErrorEvent(this.error);
}

class NextStepEvent extends CustomerSoEvent {
  final CustomerSOProcessSteps currentStep;
  NextStepEvent({this.currentStep});
}

class PreviousStepEvent extends CustomerSoEvent {
  final BuildContext context;
  final CustomerSOProcessSteps currentStep;
  PreviousStepEvent({this.currentStep, this.context});
}

class ChangeFetchingVehicleItemEvent extends CustomerSoEvent {
  final bool isLoading;

  ChangeFetchingVehicleItemEvent({this.isLoading});
}

class FetchVehicleItemsEvent extends CustomerSoEvent {}

class AddToCartEvent extends CustomerSoEvent {
  final Product product;

  AddToCartEvent({this.product});
}

class RemoveFromCartEvent extends CustomerSoEvent {
  final Product product;

  RemoveFromCartEvent({this.product});
}

class SetLoyaltyPointsEvent extends CustomerSoEvent {
  final double amount;

  SetLoyaltyPointsEvent({this.amount});
}

class ToggleCheckBoxEvent extends CustomerSoEvent {
  final bool isSelected;

  ToggleCheckBoxEvent({this.isSelected});
}

class ToggleredeemEvent extends CustomerSoEvent {
  final bool isSelected;

  ToggleredeemEvent({this.isSelected});
}

class SetTotalAmount extends CustomerSoEvent {
  final double amount;

  SetTotalAmount({this.amount});
}

class SetCustomerId extends CustomerSoEvent {
  final int id;

  SetCustomerId({this.id});
}

class CreateLatePaySo extends CustomerSoEvent {}

class CreateSo extends CustomerSoEvent {}

class AddSelectedItem extends CustomerSoEvent {
  final AssignedVehicle product;

  AddSelectedItem({this.product});
}

class ChangeVehicleList extends CustomerSoEvent {
  final List<AssignedVehicle> list;

  ChangeVehicleList({this.list});
}
