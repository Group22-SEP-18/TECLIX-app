import 'package:dio/dio.dart';
import 'package:teclix/data/models/Salesperson.dart';
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
}
