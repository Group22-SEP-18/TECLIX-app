import 'package:flutter/material.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_provider.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_provider.dart';
import 'package:teclix/logic/bloc/signup/signup_provider.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/routing/routes.dart';
import 'package:teclix/presentation/screens/employee/employee_profile/employee_profile_page.dart';
import 'package:teclix/presentation/screens/leaderboard/leaderboard.dart';
import 'package:teclix/presentation/screens/signin/signin_page.dart';

class WelcomePage extends StatelessWidget {
  static const String id = '/welcome_page';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            RoundedButton(
              title: 'register',
              colour: ColorPrimary,
              onPressed: () => Navigator.of(context).push(
                Routes.getMaterialPageRoute(SignupProvider.id, context),
              ),
            ),
            RoundedButton(
              title: 'login',
              colour: ColorPrimary,
              onPressed: () => Navigator.of(context).push(
                Routes.getMaterialPageRoute(SignInPage.id, context),
              ),
            ),
            RoundedButton(
              title: 'customer register',
              colour: ColorPrimary,
              onPressed: () => Navigator.of(context).push(
                Routes.getMaterialPageRoute(
                    CustomerRegistrationProvider.id, context),
              ),
            ),
            RoundedButton(
              title: 'profile',
              colour: ColorPrimary,
              onPressed: () => Navigator.of(context).push(
                Routes.getMaterialPageRoute(EmployeeProfilePage.id, context),
              ),
            ),
            RoundedButton(
              title: 'leaderboard',
              colour: ColorPrimary,
              onPressed: () => Navigator.of(context).push(
                Routes.getMaterialPageRoute(LeaderboardPage.id, context),
              ),
            ),
            RoundedButton(
              title: 'search',
              colour: ColorPrimary,
              onPressed: () => Navigator.of(context).push(
                Routes.getMaterialPageRoute(SearchCustomerProvider.id, context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
