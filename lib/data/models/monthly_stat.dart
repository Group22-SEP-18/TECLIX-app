class MonthlyStat {
  int orderDateMonth;
  double sales;

  MonthlyStat({this.orderDateMonth, this.sales});

  static Map<int, double> createStatList(List<dynamic> jsonList) {
    Map<int, double> stats = {};
    jsonList.forEach((element) {
      MonthlyStat temp = MonthlyStat.fromJson(element);
      stats[temp.orderDateMonth] = temp.sales;
    });
    return stats;
  }

  MonthlyStat.fromJson(Map<String, dynamic> json) {
    orderDateMonth = json['order_date__month'];
    sales = json['sales'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_date__month'] = this.orderDateMonth;
    data['sales'] = this.sales;
    return data;
  }
}
