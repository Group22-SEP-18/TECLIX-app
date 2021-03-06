import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_event.dart';
import 'package:teclix/logic/bloc/signup/signup_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/animated_page_switcher.dart';
import 'package:teclix/presentation/common/widgets/appbar_back_btn.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/common/widgets/toast_message.dart';
import 'package:teclix/presentation/screens/signin/signin_page.dart';
import 'package:teclix/presentation/screens/signup/signup_employee_Details.dart';
import 'package:teclix/presentation/screens/signup/signup_finish.dart';
import 'package:teclix/presentation/screens/signup/signup_name.dart';
import 'package:teclix/presentation/screens/signup/signup_password.dart';
import 'package:teclix/presentation/screens/signup/signup_profile_picture.dart';
import 'package:teclix/presentation/screens/signup/signup_start.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SignupScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signupBloc = BlocProvider.of<SignupBloc>(context);
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.step != current.step,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            signupBloc.add(
                PreviousStepEvent(currentStep: state.step, context: context));
            return;
          },
          child: SafeArea(
            child: BlocListener<SignupBloc, SignupState>(
              listenWhen: (prev, cur) =>
                  prev.registeredSucessfully != cur.registeredSucessfully ||
                  prev.registerErrs != cur.registerErrs,
              listener: (context, state) {
                if (state.registeredSucessfully) {
                  showToast(
                    isError: false,
                    iconSize: 40,
                    height: 60.0,
                    color: ColorMintGreen,
                    text: 'Registered Successfully!',
                    context: context,
                    durationInSec: 5,
                  );
                  Navigator.pushReplacementNamed(context, SignInPage.id);
                } else {
                  if (state.registerErrs != '') {
                    showToast(
                      isError: true,
                      iconSize: 40,
                      height: 80.0,
                      color: ColorToastRed,
                      text: state.registerErrs,
                      context: context,
                      durationInSec: 5,
                    );
                  }
                }
              },
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  automaticallyImplyLeading: false,
                  titleSpacing: 0.0,
                  title: Stack(
                    children: [
                      Positioned(
                        left: 10.0,
                        top: 0.0,
                        child: HeaderBackButton(
                          whenTapped: () => signupBloc.add(
                            PreviousStepEvent(
                                currentStep: state.step, context: context),
                          ),
                        ),
                      ),
                      Align(
                        child: AppbarHeadingText(
                          title: 'Register',
                        ),
                      ),
                    ],
                  ),
                ),
                body: CustomScrollView(
                    physics: state.step == SignupProcessSteps.SIGNUP_START
                        ? NeverScrollableScrollPhysics()
                        : ClampingScrollPhysics(),
                    slivers: [
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Container(
                          child: getAnimatedPageSwitcher(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                pageSwitcher(state.step),
                                SizedBox(
                                  height: state.step ==
                                          SignupProcessSteps.SIGNUP_FINISH
                                      ? 22.0
                                      : 43.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 5.0, top: 5.0),
                                  child: Visibility(
                                    visible: (state.step !=
                                        SignupProcessSteps.SIGNUP_START),
                                    child: DotsIndicator(
                                      dotsCount:
                                          SignupBloc.processOrder.length - 1,
                                      position: (state.flowPosition - 1 < 0)
                                          ? 0
                                          : state.flowPosition - 1,
                                      decorator: DotsDecorator(
                                        activeColor: ColorPrimary,
                                        color: ColorLightGreen,
                                        spacing: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        activeSize: Size(13.0, 13.0),
                                        size: Size(12.0, 12.0),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
              ),
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
      return SignupEmpDetails();
      break;
    case SignupProcessSteps.SIGNUP_BASIC_DETAILS:
      return SignupName();
      break;
    case SignupProcessSteps.SIGNUP_PASSWORD:
      return SignupPassword();
      break;
    case SignupProcessSteps.SIGNUP_PROFILE_PICTURE:
      return SignupProfilePicture();
      break;
    case SignupProcessSteps.SIGNUP_FINISH:
      return SignupFinish();
      break;
    default:
      return SignupStart();
      break;
  }
}
