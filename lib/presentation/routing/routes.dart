import 'package:flutter/material.dart';
import 'package:teclix/logic/bloc/customer_late_pay/customer_late_pay_provider.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_provider.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_provider.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_provider.dart';
import 'package:teclix/logic/bloc/salesperson_profile/salesperson_profile_provider.dart';
import 'package:teclix/logic/bloc/salesperson_vehicle/salesperson_vehicle_provider.dart';
import 'package:teclix/logic/bloc/signup/signup_provider.dart';
import 'package:teclix/presentation/screens/customer/customer_late_payment/customer_late_payment_search_page.dart';
import 'package:teclix/presentation/screens/customer/customer_late_payment/payment_details.dart';
import 'package:teclix/presentation/screens/customer/customer_main.dart';
import 'package:teclix/presentation/screens/customer/customer_profile/customer_profile.dart';
import 'package:teclix/presentation/screens/customer/customer_profile/customer_view_search_page.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/customer_so_search_page.dart';
import 'package:teclix/presentation/screens/employee/leaderboard_Schema/leaderboard_schema_page.dart';
import 'package:teclix/presentation/screens/employee/sales_reports/sales_main_page.dart';
import 'package:teclix/presentation/screens/navbar/navbar_controller.dart';
import 'package:teclix/presentation/screens/signin/signin_page.dart';
import 'package:teclix/presentation/screens/signin/welcome_page.dart';
import 'package:teclix/presentation/screens/start_up.dart';

class Routes {
  static final Map<String, Widget> routes = {
    StartUpPage.id: StartUpPage(),
    WelcomePage.id: WelcomePage(),
    SignupProvider.id: SignupProvider(),
    SignInPage.id: SignInPage(),
    CustomerRegistrationProvider.id: CustomerRegistrationProvider(),
    SalespersonProfileProvider.id: SalespersonProfileProvider(),
    LeaderboardProvider.id: LeaderboardProvider(),
    CustomerViewSearchPage.id: CustomerViewSearchPage(),
    CustomerLatePaymentSearchPage.id: CustomerLatePaymentSearchPage(),
    CustomerSoSearchPage.id: CustomerSoSearchPage(),
    CustomerLatePayProvider.id: CustomerLatePayProvider(),
    CustomerProfile.id: CustomerProfile(),
    NavbarController.id: NavbarController(),
    CustomerMain.id: CustomerMain(),
    SalespersonVehicleProvider.id: SalespersonVehicleProvider(),
    PaymentDetail.id: PaymentDetail(),
    CustomerSoProvider.id: CustomerSoProvider(),
    LeaderboardSchemaPage.id: LeaderboardSchemaPage(),
    SalesMainPage.id: SalesMainPage(),
  };
  //this is to call the material routes in pages
  static MaterialPageRoute getMaterialPageRoute(
      String name, BuildContext context) {
    return MaterialPageRoute(builder: (context) => Routes.routes[name]);
  }

  //this is to map the routes to the Routes in main.dart file
  static Map<String, Widget Function(BuildContext)> mapToMainRoutes(
      BuildContext context) {
    Map<String, Widget Function(BuildContext)> tempMap = {};
    Routes.routes.forEach((key, value) {
      tempMap[key] = (context) => value;
    });
    return tempMap;
  }
}
