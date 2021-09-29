import 'package:dio/dio.dart';
import 'package:teclix/data/models/DailyStats.dart';
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
      print(response.data);
      return CurrentMonthStat.fromJson(response.data);
    } on DioError catch (e) {
      print(e.response.toString());
      return e.response.toString();
    }
  }
}
