import 'package:dio/dio.dart';
import 'package:teclix/data/models/CustomerSearch.dart';
import 'package:teclix/data/url_constants.dart';

class CustomerSearchService {
  static Future<dynamic> searchCustomer({String token, String value}) async {
    var dio = Dio();
    dio.options.headers['Authorization'] = 'Token ' + token;

    try {
      var response =
          await dio.get(UrlConstants.customerSearchURL + '?search=' + value);
      List<CustomerSearch> results = [];
      response.data
          .forEach((data) => results.add(CustomerSearch.fromJson(data)));
      return [results, response.statusCode];
    } on DioError catch (e) {
      print(e.response.data);
      return [[], e.response.data.toString()];
    }
  }
}
