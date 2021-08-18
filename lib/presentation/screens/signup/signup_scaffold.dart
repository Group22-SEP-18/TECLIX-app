import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_event.dart';
import 'package:teclix/logic/bloc/signup/signup_state.dart';
import 'package:teclix/presentation/common/widgets/animated_page_switcher.dart';
import 'package:teclix/presentation/screens/signup/signup_start.dart';

class SignupScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signupBloc = BlocProvider.of<SignupBloc>(context);
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.step != current.step,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            signupBloc.add(PreviousStepEvent(currentStep: state.step));
            return;
          },
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              body: CustomScrollView(
                  physics: state.step == SignupProcessSteps.SIGNUP_START
                      ? NeverScrollableScrollPhysics()
                      : ClampingScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      child: Container(
                        child: getAnimatedPageSwitcher(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              pageSwitcher(state.step),
                              SizedBox(
                                height: 25.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}

Widget pageSwitcher(SignupProcessSteps step) {
  switch (step) {
    case SignupProcessSteps.SIGNUP_START:
      return SignupStart();
      break;
    case SignupProcessSteps.SIGNUP_EMP_DETAILS:
      // TODO: Handle this case.
      break;
    case SignupProcessSteps.SIGNUP_BASIC_DETAILS:
      // TODO: Handle this case.
      break;
    case SignupProcessSteps.SIGNUP_PASSWORD:
      // TODO: Handle this case.
      break;
    case SignupProcessSteps.SIGNUP_PROFILE_PICTURE:
      // TODO: Handle this case.
      break;
    case SignupProcessSteps.SIGNUP_FINISH:
      // TODO: Handle this case.
      break;
  }
}
