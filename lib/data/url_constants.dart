abstract class UrlConstants {
  static final String baseURL = 'https://teclix.herokuapp.com/';

//  user system related  urls

  static final String userUrl = 'staff-api/';
  static final String userBasicUrl = baseURL + userUrl;

  static final String userRegitserURL = userBasicUrl + 'register/';
  static final String userLoginURL = userBasicUrl + 'login/salesperson/';
  static final String userLogoutURL = userBasicUrl + 'logout/';
  static final String autoLoginUrl = userBasicUrl + 'logged-in-user/';

//  customer sub system related urls

  static final String customerUrl = 'customer-api/';
  static final String customerBasicurl = baseURL + customerUrl;
}
