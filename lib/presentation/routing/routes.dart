import 'package:flutter/material.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_provider.dart';
import 'package:teclix/logic/bloc/signup/signup_provider.dart';
import 'package:teclix/presentation/screens/employee_profile/employee_profile_page.dart';
import 'package:teclix/presentation/screens/leaderboard/leaderboard.dart';
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
    EmployeeProfilePage.id: EmployeeProfilePage(),
    LeaderboardPage.id: LeaderboardPage(),
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
