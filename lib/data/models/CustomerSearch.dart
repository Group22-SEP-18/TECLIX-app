class CustomerSearch {
  int id;
  String shopName;
  String ownerFirstName;
  String ownerLastName;
  String email;
  String contactNo;
  String profilePicture;
  String latitude;
  String longitude;
  String street;
  String city;
  String district;
  String loyaltyPoints;
  String outstanding;

  CustomerSearch(
      {this.id,
      this.shopName,
      this.ownerFirstName,
      this.ownerLastName,
      this.email,
      this.contactNo,
      this.profilePicture,
      this.latitude,
      this.longitude,
      this.street,
      this.city,
      this.district,
      this.loyaltyPoints,
      this.outstanding});

  CustomerSearch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopName = json['shop_name'];
    ownerFirstName = json['owner_first_name'];
    ownerLastName = json['owner_last_name'];
    email = json['email'];
    contactNo = json['contact_no'];
    profilePicture = json['profile_picture'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    street = json['street'];
    city = json['city'];
    district = json['district'];
    loyaltyPoints = json['loyalty_points'];
    outstanding = json['outstanding'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_name'] = this.shopName;
    data['owner_first_name'] = this.ownerFirstName;
    data['owner_last_name'] = this.ownerLastName;
    data['email'] = this.email;
    data['contact_no'] = this.contactNo;
    data['profile_picture'] = this.profilePicture;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['street'] = this.street;
    data['city'] = this.city;
    data['district'] = this.district;
    data['loyalty_points'] = this.loyaltyPoints;
    data['outstanding'] = this.outstanding;
    return data;
  }
}
