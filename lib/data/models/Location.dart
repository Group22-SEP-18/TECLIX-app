class Location {
  double latitude;
  double longitude;
  String street;
  String city;
  String district;

  Location({
    this.latitude,
    this.longitude,
    this.street,
    this.city,
    this.district,
  });

  Location copyWith({
    double latitude,
    double longitude,
    String street,
    String city,
    String district,
  }) {
    return Location(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      street: street ?? this.street,
      city: city ?? this.city,
      district: district ?? this.district,
    );
  }
}
