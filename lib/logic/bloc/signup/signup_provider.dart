import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'signup_bloc.dart';
import 'signup_state.dart';

class SignupProvider extends BlocProvider<SignupBloc> {
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
    // ignore: close_sinks
    final signupBloc = BlocProvider.of<SignupBloc>(context);

    final scaffold = Scaffold(
      body: BlocBuilder<SignupBloc, SignupState>(
        buildWhen: (pre, current) => true,
        builder: (context, state) {
          return Center(
            child: Text("Hi...Welcome to BLoC"),
          );
        },
      ),
    );

    return MultiBlocListener(
      listeners: [
        BlocListener<SignupBloc, SignupState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false) print("ERROR: ${state.error}");
          },
        ),
      ],
      child: scaffold,
    );
  }
}
