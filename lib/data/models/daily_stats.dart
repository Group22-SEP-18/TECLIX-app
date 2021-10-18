class DailyStats {
  double totalSales;
  int shops;
  int payCount;

  DailyStats({this.totalSales, this.shops, this.payCount});

  DailyStats.fromJson(Map<String, dynamic> json) {
    totalSales = json['total_sales'];
    shops = json['shops'];
    payCount = json['pay_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_sales'] = this.totalSales;
    data['shops'] = this.shops;
    data['pay_count'] = this.payCount;
    return data;
  }
}
