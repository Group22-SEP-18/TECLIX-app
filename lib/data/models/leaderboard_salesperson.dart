class LeaderboardSalesperson {
  int id;
  String employeeNo;
  String firstName;
  String lastName;
  String profilePicture;

  LeaderboardSalesperson(
      {this.id,
      this.employeeNo,
      this.firstName,
      this.lastName,
      this.profilePicture});

  LeaderboardSalesperson.fromJson(Map<String, dynamic> json) {
    employeeNo = json['employee_no'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profilePicture = json['profile_picture'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employee_no'] = this.employeeNo;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_picture'] = this.profilePicture;
    data['id'] = this.id;
    return data;
  }
}
