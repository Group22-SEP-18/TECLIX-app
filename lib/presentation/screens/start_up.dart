import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/root/root_bloc.dart';
import 'package:teclix/logic/bloc/root/root_state.dart';
import 'package:teclix/presentation/screens/navbar/navbar_controller.dart';
import 'package:teclix/presentation/screens/signin/signin_page.dart';
import 'package:teclix/presentation/screens/signin/welcome_page.dart';

class StartUpPage extends StatelessWidget {
  static const String id = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<RootBloc, RootState>(
        listenWhen: (prev, cur) => prev.userLoginState != cur.userLoginState,
        listener: (context, state) {
          switch (state.userLoginState) {
            case UserLoginState.LOGGED_IN:
              //TODO: change this to home page logged in

              Navigator.pushReplacementNamed(context, SignInPage.id);
              break;
            case UserLoginState.LOGGED_OUT:
              Navigator.pushReplacementNamed(context, NavbarController.id);
              break;
            default:
              Navigator.pushReplacementNamed(context, WelcomePage.id);
          }
        },
        buildWhen: (previous, current) => previous.loading != current.loading,
        builder: (context, state) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
