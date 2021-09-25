class Product {
  String id;
  String shortName;
  String longName;
  double price;
  String productImage;
  int quantity;
  String category;

  Product({
    this.id,
    this.shortName,
    this.longName,
    this.price,
    this.productImage,
    this.quantity,
    this.category,
  });

  static Product getByProductId(String id, List<Product> products) {
    for (var i = 0; i < products.length; i++) {
      if (products[i].id == id) {
        return products[i];
      }
    }
  }

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shortName = json['short_name'];
    longName = json['long_name'];
    productImage = json['product_image'];
    category = json['category'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['short_name'] = this.shortName;
    data['long_name'] = this.longName;
    data['product_image'] = this.productImage;
    data['category'] = this.category;
    data['price'] = this.price;
    return data;
  }
}
