import 'package:teclix/data/models/product.dart';

class AssignedVehicle {
  Product product;
  int quantity;

  AssignedVehicle({this.product, this.quantity});

  static AssignedVehicle getByProductId(
      String id, List<AssignedVehicle> products) {
    for (var i = 0; i < products.length; i++) {
      if (products[i].product.id == id) {
        return products[i];
      }
    }
    return null;
  }

  static AssignedVehicle getByBarcode(
      String barcode, List<AssignedVehicle> products) {
    for (var i = 0; i < products.length; i++) {
      if (products[i].product.barcode == barcode) {
        return products[i];
      }
    }
    return null;
  }

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
