import 'package:teclix/data/models/Customer.dart';
import 'package:teclix/data/models/CustomerLocation.dart';

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
