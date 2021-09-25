class Vehicle {
  int id;
  String vehicleNumber;
  String vehicleType;
  String vehicleImage;
  String vehicleModel;

  Vehicle(
      {this.id,
      this.vehicleNumber,
      this.vehicleType,
      this.vehicleImage,
      this.vehicleModel});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicleNumber = json['vehicle_number'];
    vehicleType = json['vehicle_type'];
    vehicleImage = json['vehicle_image'];
    vehicleModel = json['vehicle_model'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['vehicle_number'] = this.vehicleNumber;
    data['vehicle_type'] = this.vehicleType;
    data['vehicle_image'] = this.vehicleImage;
    data['vehicle_model'] = this.vehicleModel;
    return data;
  }
}
