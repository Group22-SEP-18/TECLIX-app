class OrderItems {
  int id;
  int quantity;
  String priceAtTheTime;
  int product;

  OrderItems({this.id, this.quantity, this.priceAtTheTime, this.product});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    priceAtTheTime = json['price_at_the_time'];
    product = json['product'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['price_at_the_time'] = this.priceAtTheTime;
    data['product'] = this.product;
    return data;
  }
}
