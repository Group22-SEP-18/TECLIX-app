import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_event.dart';
import 'package:teclix/logic/bloc/signup/signup_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/text_button.dart';
import 'package:teclix/presentation/screens/signin/signin_page.dart';
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class SignupFinish extends StatelessWidget {
  @override
  Widget build(BuildContext topcontext) {
    final signupBloc = BlocProvider.of<SignupBloc>(topcontext);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<SignupBloc, SignupState>(
            buildWhen: (prev, cur) => prev.loading != cur.loading,
            builder: (context, state) {
              return state.loading
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100.0,
                        ),
                        Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(),
                            height: 80.0,
                            width: 80.0,
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 65.0,
                        ),
                        MainHeading(
                          text: "Confirm Registration",
                          fontSize: 24.0,
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        CommonPadding(
                          child: InfoText(
                            fontSize: 18.0,
                            text:
                                "Please note that once you confirm your registration the account "
                                "will be sent to the relevant authorities for approval."
                                "Please contact your supervisor for more information.\n"
                                "Welcome to Team TECLIX!",
                          ),
                        ),
                      ],
                    );
            },
          ),
          Spacer(),
          BlocBuilder<SignupBloc, SignupState>(
            buildWhen: (prev, cur) =>
                prev.registeredSucessfully != cur.registeredSucessfully,
            builder: (context, state) {
              return state.registeredSucessfully
                  ? CommonPadding(
                      child: RoundedButton(
                        title: 'Go to Login',
                        titleColor: Colors.white,
                        colour: ColorPrimary,
                        onPressed: () => Navigator.pushReplacementNamed(
                            context, SignInPage.id),
                      ),
                    )
                  : Column(
                      children: [
                        BlocBuilder<SignupBloc, SignupState>(
                          builder: (context, state) {
                            return CommonPadding(
                              child: RoundedButton(
                                title: 'Finish',
                                titleColor: Colors.white,
                                colour: ColorPrimary,
                                onPressed: () => signupBloc.add(
                                  SubmitUserEvent(
                                      salesperson: state.salesperson,
                                      context: context),
                                ),
                              ),
                            );
                          },
                        ),
                        TextBtn(
                          text: 'Cancel',
                          onClick: () => Navigator.pop(context),
                        ),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}
