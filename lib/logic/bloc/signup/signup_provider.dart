import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/presentation/screens/signup/signup_scaffold.dart';

import 'signup_bloc.dart';
import 'signup_state.dart';

class SignupProvider extends BlocProvider<SignupBloc> {
  static const String id = '/salesperson_register';

  SignupProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => SignupBloc(context),
          child: SignupView(),
        );
}

class SignupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SignupBloc, SignupState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
      ],
      // add bloc listner to redirect to login page once sign up is complete
      child: SignupScaffold(),
    );
  }
}
