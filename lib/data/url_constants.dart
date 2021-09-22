abstract class UrlConstants {
  static final String baseURL = 'https://teclix.herokuapp.com/';

//  user system related  urls

  static final String userBasicURL = baseURL + 'staff-api/';

  static final String userRegitserURL = userBasicURL + 'register/';
  static final String userLoginURL = userBasicURL + 'login/salesperson/';
  static final String userLogoutURL = userBasicURL + 'logout/';
  static final String autoLoginURL = userBasicURL + 'logged-in-user/';

//  customer sub system related urls

  static final String customerBasicURL = baseURL + 'customer-api/';
  static final String customerSearchURL = customerBasicURL + 'search/';
}
