class MonthlyStatComparison {
  int soCount;
  int payCount;
  int customerCount;

  MonthlyStatComparison({this.soCount, this.payCount, this.customerCount});

  MonthlyStatComparison.fromJson(Map<String, dynamic> json) {
    soCount = json['so_count'];
    payCount = json['pay_count'];
    customerCount = json['customer_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['so_count'] = this.soCount;
    data['pay_count'] = this.payCount;
    data['customer_count'] = this.customerCount;
    return data;
  }
}
