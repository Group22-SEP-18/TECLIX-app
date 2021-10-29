import 'package:dio/dio.dart';
import 'package:teclix/data/models/customer.dart';
import 'package:teclix/data/url_constants.dart';

class CustomerRegisterService {
  static Future<String> registerCustomer(
      {Customer customer, String token}) async {
    var dio = Dio();

    try {
      dio.options.headers['Authorization'] = 'Token ' + token;

      FormData formData = FormData.fromMap({
        'email': customer.email,
        'shop_name': customer.shopName,
        'owner_first_name': customer.ownerFistName,
        'owner_last_name': customer.ownerLastName,
        'latitude': customer.address.latitude,
        'longitude': customer.address.longitude,
        'street': customer.address.street,
        'city': customer.address.city,
        'district': customer.address.district,
        'contact_no': customer.contactNo,
        'profile_picture': customer.profilePicture == null
            ? ''
            : await MultipartFile.fromFile(
                customer.profilePicture.path,
                filename: customer.profilePicture.path.split('/').last,
              ),
      });
      var response =
          await dio.post(UrlConstants.customerBasicURL, data: formData);
      return response.statusCode.toString();
    } on DioError catch (e) {
      String errorString = '';
      for (var err in e.response.data.values) {
        errorString += err[0] + '\n';
      }
      return errorString;
    }
  }
}
