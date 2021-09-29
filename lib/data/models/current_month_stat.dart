class CurrentMonthStat {
  int salesperson;
  double totalSales;
  double totalLatePay;

  CurrentMonthStat({this.salesperson, this.totalSales, this.totalLatePay});

  CurrentMonthStat.fromJson(Map<String, dynamic> json) {
    salesperson = json['salesperson'];
    totalSales = json['total_sales'];
    totalLatePay = json['total_late_pay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['salesperson'] = this.salesperson;
    data['total_sales'] = this.totalSales;
    data['total_late_pay'] = this.totalLatePay;
    return data;
  }
}
