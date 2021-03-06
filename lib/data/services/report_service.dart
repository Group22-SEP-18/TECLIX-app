import 'package:dio/dio.dart';
import 'package:teclix/data/models/daily_stats.dart';
import 'package:teclix/data/models/monthly_stat.dart';
import 'package:teclix/data/models/monthly_stat_comparison.dart';
import 'package:teclix/data/models/current_month_stat.dart';
import 'package:teclix/data/url_constants.dart';

class ReportService {
  static Future<dynamic> fetchDailyStats({token, id}) async {
    var dio = Dio();
    dio.options.headers['Authorization'] = 'Token ' + token;
    try {
      var response = await dio.get(UrlConstants.dailystatURL + id);
      return DailyStats.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response.toString());
      return e.response.toString();
    }
  }

  static Future<dynamic> fetchCurrentMonthStats({token, id}) async {
    var dio = Dio();
    dio.options.headers['Authorization'] = 'Token ' + token;
    try {
      var response = await dio.get(UrlConstants.currentMonthStatURL + id);
      return CurrentMonthStat.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response.toString());
      return e.response.toString();
    }
  }

  static Future<dynamic> fetchMonthlySales({token, id}) async {
    var dio = Dio();
    dio.options.headers['Authorization'] = 'Token ' + token;
    try {
      var response = await dio.get(UrlConstants.monthlyStatURL + id);
      return MonthlyStat.createStatList(response.data);
    } on DioError catch (e) {
      print(e.response.toString());
      return e.response.toString();
    }
  }

  static Future<dynamic> fetchMonthlyStats({token, id}) async {
    var dio = Dio();
    dio.options.headers['Authorization'] = 'Token ' + token;
    try {
      var response = await dio.get(UrlConstants.monthlyStatCompURL + id);
      return MonthlyStatComparison.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response.toString());
      return e.response.toString();
    }
  }
}
