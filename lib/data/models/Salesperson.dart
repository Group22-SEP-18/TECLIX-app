import 'dart:io';

class Salesperson {
  String employeeNo;
  String email;
  String firstName;
  String lastName;
  String contactNo;
  String password;
  File profilePicture;

  Salesperson({
    this.employeeNo,
    this.email,
    this.firstName,
    this.lastName,
    this.contactNo,
    this.password,
    this.profilePicture,
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
}
