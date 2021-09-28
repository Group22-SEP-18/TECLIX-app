import 'package:teclix/data/models/OrderItem.dart';

class ServiceOrder {
  int id;
  List<OrderItems> orderItems;
  String orderDate;
  String originalPrice;
  String discount;
  int customer;

  ServiceOrder(
      {this.id,
      this.orderItems,
      this.orderDate,
      this.originalPrice,
      this.discount,
      this.customer});

  ServiceOrder.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['order_items'] != null) {
      List<OrderItems> orderItems = [];
      json['order_items'].forEach((v) {
        orderItems.add(new OrderItems.fromJson(v));
      });
    }
    orderDate = json['order_date'];
    originalPrice = json['original_price'];
    discount = json['discount'];
    customer = json['customer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.orderItems != null) {
      data['order_items'] = this.orderItems.map((v) => v.toJson()).toList();
    }
    data['order_date'] = this.orderDate;
    data['original_price'] = this.originalPrice;
    data['discount'] = this.discount;
    data['customer'] = this.customer;
    return data;
  }
}
