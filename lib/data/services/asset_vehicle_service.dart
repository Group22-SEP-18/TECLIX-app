import 'package:dio/dio.dart';
import 'package:teclix/data/models/SalespersonVehicle.dart';
import 'package:teclix/data/url_constants.dart';

class AssetVehicleService {
  static Future<dynamic> fetchVehicleData({token}) async {
    var dio = Dio();
    dio.options.headers['Authorization'] = 'Token ' + token;
    try {
      var response = await dio.get(UrlConstants.spVehicleURL);
      var data = SalespersonVehicle.fromJson(response.data[0]);

      return data;
    } on DioError catch (e) {
      print(e.response.toString());
      return e.response.toString();
    }
  }
}
