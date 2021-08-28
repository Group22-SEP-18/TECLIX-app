import 'package:flutter/material.dart';
import 'package:teclix/logic/bloc/signup/signup_provider.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_text_field.dart';
import 'package:teclix/presentation/common/widgets/text_button.dart';
import 'package:teclix/presentation/routing/routes.dart';
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';

class SignInPage extends StatelessWidget {
  static const String id = '/sigin';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        ),
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //temp
                    child: Image.asset('static/images/login_cover.png'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  CommonPadding(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        RoundedTextField(
                          hint: 'Email',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RoundedTextField(
                          hint: 'Password',
                          hideText: true,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  CommonPadding(
                    child: RoundedButton(
                      title: 'Login to my account',
                      titleColor: Colors.white,
                      colour: ColorPrimary,
                      onPressed: () {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InfoText(text: 'Don\'t have an account yet?'),
                      SizedBox(
                        width: 15.0,
                      ),
                      TextBtn(
                          text: 'Sign Up',
                          fontWeight: FontWeight.bold,
                          fontSize: 19.0,
                          onClick: () {
                            Future.delayed(Duration(milliseconds: 250), () {
                              Navigator.of(context).pushReplacement(
                                Routes.getMaterialPageRoute(
                                    SignupProvider.id, context),
                              );
                            });
                          }),
                    ],
                  ),
                  Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
