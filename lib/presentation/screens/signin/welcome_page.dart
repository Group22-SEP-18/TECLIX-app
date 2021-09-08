import 'package:flutter/material.dart';
import 'package:teclix/logic/bloc/signup/signup_provider.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/routing/routes.dart';
import 'package:teclix/presentation/screens/signin/signin_page.dart';
import 'package:teclix/presentation/screens/signin/welcome_clip_path.dart';

class WelcomePage extends StatelessWidget {
  static const String id = '/welcome-page';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(230.0),
          child: ClipPath(
            clipper: WelcomeClipPath(),
            child: Container(
              color: ColorPrimary,
              child: Center(
                child: SizedBox(
                  width: 350.0,
                  child:
                      Image.asset('static/images/White_logo_no_background.png'),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 10.0,
            ),
            SizedBox(
              height: 300.0,
              child: Image.asset('static/images/welcome.png'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Column(
              children: [
                CommonPadding(
                  child: RoundedButton(
                    title: 'Login',
                    colour: ColorPrimary,
                    onPressed: () => Navigator.of(context).push(
                      Routes.getMaterialPageRoute(SignInPage.id, context),
                    ),
                    titleColor: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                CommonPadding(
                  child: RoundedButton(
                    title: 'Register',
                    colour: ColorDarkGreen,
                    onPressed: () => Navigator.of(context).push(
                      Routes.getMaterialPageRoute(SignupProvider.id, context),
                    ),
                    titleColor: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            )
          ],
        ),
      ),
    );
  }
}
