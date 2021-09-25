import 'package:teclix/data/models/AssignedVehicle.dart';
import 'package:teclix/data/models/Vehicle.dart';

class SalespersonVehicle {
  int id;
  Vehicle vehicle;
  List<AssignedVehicle> assignedVehicle;
  int salesperson;

  SalespersonVehicle(
      {this.id, this.vehicle, this.assignedVehicle, this.salesperson});

  SalespersonVehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vehicle =
        json['vehicle'] != null ? new Vehicle.fromJson(json['vehicle']) : null;
    if (json['assigned_vehicle'] != null) {
      assignedVehicle = [];
      json['assigned_vehicle'].forEach((v) {
        assignedVehicle.add(new AssignedVehicle.fromJson(v));
      });
    }
    salesperson = json['salesperson'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.vehicle != null) {
      data['vehicle'] = this.vehicle.toJson();
    }
    if (this.assignedVehicle != null) {
      data['assigned_vehicle'] =
          this.assignedVehicle.map((v) => v.toJson()).toList();
    }
    data['salesperson'] = this.salesperson;
    return data;
  }
}
