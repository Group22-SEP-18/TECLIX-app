import 'package:teclix/data/models/Product.dart';

class AssignedVehicle {
  Product product;
  int quantity;

  AssignedVehicle({this.product, this.quantity});

  AssignedVehicle.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product.toJson();
    }
    data['quantity'] = this.quantity;
    return data;
  }
}
