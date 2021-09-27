import 'package:dio/dio.dart';
import 'package:teclix/data/models/SalespersonVehicle.dart';
import 'package:teclix/data/models/Vehicle.dart';
import 'package:teclix/data/url_constants.dart';

class AssetVehicleService {
  static Future<dynamic> fetchVehicleData({token}) async {
    var dio = Dio();
    dio.options.headers['Authorization'] = 'Token ' + token;
    try {
      var response = await dio.get(UrlConstants.spVehicleURL);
      var data;
      print(response.data.length);

      if (response.data.length != 0) {
        data = SalespersonVehicle.fromJson(response.data[0]);
      } else {
        data = SalespersonVehicle(
            assignedVehicle: [], salesperson: 0, vehicle: Vehicle(), id: 0);
      }

      return data;
    } on DioError catch (e) {
      print(e.response.toString());
      return e.response.toString();
    }
  }

  static Future<dynamic> fetchVehicleProducts({token}) async {
    var dio = Dio();
    dio.options.headers['Authorization'] = 'Token ' + token;
    try {
      var response = await dio.get(UrlConstants.spVehicleURL);
      SalespersonVehicle data;

      if (response.data.length != 0) {
        data = SalespersonVehicle.fromJson(response.data[0]);
      } else {
        data = SalespersonVehicle(
            assignedVehicle: [], salesperson: 0, vehicle: Vehicle(), id: 0);
      }

      return data.assignedVehicle;
    } on DioError catch (e) {
      print(e.response.toString());
      return e.response.toString();
    }
  }
}
