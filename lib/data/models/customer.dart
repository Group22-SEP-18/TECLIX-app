import 'dart:io';

import 'package:teclix/data/models/customer_location.dart';

class Customer {
  String customerId;
  String shopName;
  String ownerFistName;
  String ownerLastName;
  String email;
  String contactNo;
  File profilePicture;
  double loyaltyPoints;
  double outstanding;
  CustomerLocation address;
  String profilePicUrl;

  Customer.searchResult({
    this.shopName,
    this.ownerFistName,
    this.ownerLastName,
    this.profilePicUrl,
  });

  Customer.selectedCustomer({
    this.shopName,
    this.ownerFistName,
    this.ownerLastName,
    this.loyaltyPoints,
    this.address,
  });

  Customer({
    this.customerId,
    this.shopName,
    this.ownerFistName,
    this.ownerLastName,
    this.email,
    this.contactNo,
    this.profilePicture,
    this.loyaltyPoints,
    this.outstanding,
    this.address,
  });

  Customer copyWith({
    String customerId,
    String shopName,
    String ownerFistName,
    String ownerLastName,
    String email,
    String contactNo,
    File profilePicture,
    double loyaltyPoints,
    double outstanding,
    CustomerLocation address,
  }) {
    return Customer(
      customerId: customerId ?? this.customerId,
      shopName: shopName ?? this.shopName,
      ownerFistName: ownerFistName ?? this.ownerFistName,
      ownerLastName: ownerLastName ?? this.ownerLastName,
      email: email ?? this.email,
      contactNo: contactNo ?? this.contactNo,
      profilePicture: profilePicture ?? this.profilePicture,
      loyaltyPoints: loyaltyPoints ?? this.loyaltyPoints,
      outstanding: outstanding ?? this.outstanding,
      address: address ?? this.address,
    );
  }
}
