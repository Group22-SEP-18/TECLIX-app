import 'package:dio/dio.dart';
import 'package:teclix/data/models/salesperson.dart';
import 'package:teclix/data/url_constants.dart';

class AuthService {
  static Future<String> registerUser(Salesperson salesperson) async {
    try {
      FormData formData = FormData.fromMap({
        'email': salesperson.email,
        'employee_no': salesperson.employeeNo,
        'password': salesperson.password,
        'user_role': salesperson.userRole,
        'first_name': salesperson.firstName,
        'last_name': salesperson.lastName,
        'contact_no': salesperson.contactNo,
        'profile_picture': await MultipartFile.fromFile(
          salesperson.profilePicture.path,
          filename: salesperson.profilePicture.path.split('/').last,
        ),
      });
      var dio = Dio();
      var response =
          await dio.post(UrlConstants.userRegitserURL, data: formData);
      return response.statusCode.toString();
    } on DioError catch (e) {
      print(e.response.toString());
      return e.response.toString();
    }
  }

  static Future<Map<String, dynamic>> loginUser(
      Map<String, String> credentials) async {
    var dio = Dio();

    try {
      var response = await dio.post(UrlConstants.userLoginURL, data: {
        'email': credentials['email'],
        'password': credentials['password']
      });

      return {'data': response.data['data']};
    } on DioError catch (e) {
      print(e.response.data['error']);
      return {'error': e.response.data['error']};
    }
  }

  static Future<String> logOutUser({token}) async {
    var dio = Dio();
    try {
      dio.options.headers['Authorization'] = 'Token ' + token;
      var response = await dio.post(UrlConstants.userLogoutURL);
      return response.statusCode.toString();
    } on DioError catch (e) {
      print(e.response.data);
      return e.response.data['detail'].toString();
    }
  }

  static Future<String> logInAuto({token}) async {
    var dio = Dio();
    try {
      dio.options.headers['Authorization'] = 'Token ' + token;
      var response = await dio.get(UrlConstants.autoLoginURL);
      return response.statusCode.toString();
    } on DioError catch (e) {
      print(e.response.data);
      return e.response.data['detail'].toString();
    }
  }
}
