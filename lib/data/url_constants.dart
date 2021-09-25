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
  static final String customerLatePayURL =
      customerBasicURL + 'late-payment/pay';

//  asset subsystem related urls

  static final String assetBasicURL = baseURL + 'asset-api/';
  static final String spVehicleURL = assetBasicURL + 'vehicle/salesperson/';

//  salesperson sub system urls

  static final String salespersonBasicURL = baseURL + 'salesperson-api/';
  static final String allLeaderboardUrl = salespersonBasicURL + 'leaderboard/';

//  others
  static final String dummyprofileImage =
      'https://res.cloudinary.com/dtsbekuau/image/upload/v1632580308/teclix/media/staff/dummy-profile_i1v5wc.png';
}
