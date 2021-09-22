import 'package:dio/dio.dart';
import 'package:teclix/data/url_constants.dart';

class CustomerLatePayService {
  static Future<dynamic> addLatePay(
      {String token, Map<String, dynamic> data}) async {
    var dio = Dio();
    dio.options.headers['Authorization'] = 'Token ' + token;
    try {
      var response =
          await dio.post(UrlConstants.customerLatePayURL, data: data);
      return response.statusCode.toString();
    } on DioError catch (e) {
      print('err');
      print(e.response.data);
      // return {'error': e.response.data['error']};
    }
  }
}
