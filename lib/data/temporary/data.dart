import 'package:teclix/data/models/Customer.dart';
import 'package:teclix/data/models/CustomerLocation.dart';
import 'package:teclix/data/models/Product.dart';

List<Customer> customerResults = [
  Customer.searchResult(
    shopName: 'abc stores',
    ownerLastName: 'perera',
    ownerFistName: 'saman',
    profilePicUrl: 'static/images/profile_placeholder.png',
  ),
  Customer.searchResult(
    shopName: 'scd stores',
    ownerLastName: 'peries',
    ownerFistName: 'kamal',
    profilePicUrl: 'static/images/profile_placeholder.png',
  ),
];

Customer selectedCustomer = Customer.selectedCustomer(
  shopName: 'Gamini Stores Pvt Ltd',
  ownerFistName: 'Gamini',
  ownerLastName: 'Perera',
  address: CustomerLocation.address(
    street: '39A kamal lane',
    city: 'Moratuwa',
    district: 'Colombo',
  ),
  loyaltyPoints: 250.0,
);

List<Product> vehicleProd = [
  Product(
    productId: 'ab1',
    productImageUrl: 'static/images/dummy.jpeg',
    price: 125.00,
    shortName: 'Hawian Cookies',
    longName: 'Munchee Biscuit Hawaian Cookies',
    quantity: 250,
  ),
  Product(
    productId: 'ab2',
    productImageUrl: 'static/images/dummy2.jpeg',
    price: 125.00,
    shortName: 'Fiji Cookies',
    longName: 'Munchee Biscuit Fiji Cookies',
    quantity: 250,
  ),
  Product(
    productId: 'ab3',
    productImageUrl: 'static/images/dummy2.jpeg',
    price: 400.00,
    shortName: 'Salt Cookies',
    longName: 'Munchee Biscuit salt Cookies',
    quantity: 100,
  ),
  Product(
    productId: 'ab4',
    productImageUrl: 'static/images/dummy.jpeg',
    price: 300.00,
    shortName: 'Sweet Cookies',
    longName: 'Munchee Biscuit Sweet Cookies',
    quantity: 111,
  ),
];
