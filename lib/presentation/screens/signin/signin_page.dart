import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/root/root_bloc.dart';
import 'package:teclix/logic/bloc/root/root_event.dart';
import 'package:teclix/logic/bloc/root/root_state.dart';
import 'package:teclix/logic/bloc/signup/signup_provider.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_text_field.dart';
import 'package:teclix/presentation/common/widgets/text_button.dart';
import 'package:teclix/presentation/screens/navbar/navbar_controller.dart';
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';

class SignInPage extends StatelessWidget {
  static const String id = '/sigin';

  static final emailController = TextEditingController();
  static final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final rootBloc = BlocProvider.of<RootBloc>(context);
    return SafeArea(
      child: BlocListener<RootBloc, RootState>(
        listener: (context, state) {
          if (state.userLoginState == UserLoginState.LOGGED_IN) {
            Navigator.pushReplacementNamed(context, NavbarController.id);
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(
              child: AppbarHeadingText(
                title: 'Login',
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
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      child: Image.asset('static/images/login_cover.png'),
                      height: 350.0,
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
                          BlocBuilder<RootBloc, RootState>(
                            builder: (context, state) {
                              return RoundedTextField(
                                controller: emailController,
                                hint: 'Email',
                              );
                            },
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          BlocBuilder<RootBloc, RootState>(
                            builder: (context, state) {
                              return RoundedTextField(
                                controller: passwordController,
                                hint: 'Password',
                                hideText: true,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    BlocBuilder<RootBloc, RootState>(
                      buildWhen: (prev, cur) => prev.loading != cur.loading,
                      builder: (context, state) {
                        return Visibility(
                          visible: state.loading,
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    Spacer(),
                    SizedBox(
                      height: 30.0,
                    ),
                    CommonPadding(
                      child: RoundedButton(
                        title: 'Login to my account',
                        titleColor: Colors.white,
                        colour: ColorPrimary,
                        onPressed: () => rootBloc.add(
                          LogInUserEvent(
                            credentials: {
                              'email': emailController.text,
                              'password': passwordController.text,
                            },
                            buildContext: context,
                          ),
                        ),
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
                                Navigator.pushNamed(context, SignupProvider.id);
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
      ),
    );
  }
}
