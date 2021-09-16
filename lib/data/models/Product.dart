class Product {
  String productId;
  String productName;
  double price;
  String productImageUrl;
  int quantity;

  Product({
    this.productId,
    this.productName,
    this.price,
    this.productImageUrl,
    this.quantity,
  });

  static Product getByProductId(String id, List<Product> products) {
    for (var i = 0; i < products.length; i++) {
      if (products[i].productId == id) {
        return products[i];
      }
    }
  }
}
