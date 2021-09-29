import 'package:teclix/data/models/OrderItem.dart';

class ServiceOrder {
  List<OrderItems> orderItems;
  String soType;
  String originalPrice;
  String discount;
  int customer;

  ServiceOrder({
    this.orderItems,
    this.soType,
    this.originalPrice,
    this.discount,
    this.customer,
  });

  ServiceOrder.fromJson(Map<String, dynamic> json) {
    if (json['order_items'] != null) {
      List<OrderItems> orderItems = [];
      json['order_items'].forEach((v) {
        orderItems.add(new OrderItems.fromJson(v));
      });
    }
    soType = json['so_type'];
    originalPrice = json['original_price'];
    discount = json['discount'];
    customer = json['customer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems.map((v) => v.toJson()).toList();
    }
    data['so_type'] = this.soType;
    data['original_price'] = this.originalPrice;
    data['discount'] = this.discount;
    data['customer'] = this.customer;
    return data;
  }
}
