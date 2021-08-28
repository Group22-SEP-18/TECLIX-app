import 'package:flutter/material.dart';
import 'package:teclix/logic/bloc/signup/signup_provider.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/routing/routes.dart';
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
              title: 'register',
              colour: ColorPrimary,
              onPressed: () => Navigator.of(context).push(
                Routes.getMaterialPageRoute(SignInPage.id, context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
