import 'dart:io';

class Salesperson {
  String employeeNo;
  String email;
  String firstName;
  String lastName;
  String contactNo;
  String password;
  File profilePicture;
  String userRole;
  String profilePictureUrl;

  Salesperson({
    this.employeeNo,
    this.email,
    this.firstName,
    this.lastName,
    this.contactNo,
    this.password,
    this.profilePicture,
    this.userRole = 'SALESPERSON',
  });

  Salesperson copyWith({
    String employeeNo,
    String email,
    String firstName,
    String lastName,
    String contactNo,
    String password,
    File profilePicture,
  }) {
    return Salesperson(
      employeeNo: employeeNo ?? this.employeeNo,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      contactNo: contactNo ?? this.contactNo,
      password: password ?? this.password,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  Salesperson.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    employeeNo = json['employee_no'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    contactNo = json['contact_no'];
    profilePictureUrl = json['profile_picture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['employee_no'] = this.employeeNo;
    data['password'] = this.password;
    data['user_role'] = this.userRole;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['contact_no'] = this.contactNo;
    return data;
  }
}
