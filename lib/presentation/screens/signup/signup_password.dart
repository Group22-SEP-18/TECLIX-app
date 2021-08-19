import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_event.dart';
import 'package:teclix/logic/bloc/signup/signup_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_text_field.dart';
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class SignupPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signupBloc = BlocProvider.of<SignupBloc>(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 30.0,
          ),
          MainHeading(
            text: 'Password',
            fontSize: 24.0,
          ),
          CommonPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<SignupBloc, SignupState>(
                  builder: (context, state) {
                    return RoundedTextField(
                      hint: 'Password',
                      hideText: true,
                    );
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                BlocBuilder<SignupBloc, SignupState>(
                  builder: (context, state) {
                    return RoundedTextField(
                      hint: 'Re-enter Password',
                      hideText: true,
                    );
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
          CommonPadding(
            child: InfoText(
              text:
                  " 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper nulla ex, "
                  "vitae tempus lacus condimentum vel. Praesent semper, "
                  "lectus in dictum scelerisque, erat Leo viverra sem, non sagittis est diam ut nisl',",
            ),
          ),
          BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              return CommonPadding(
                child: RoundedButton(
                  title: 'Next',
                  titleColor: Colors.white,
                  colour: ColorPrimary,
                  onPressed: () => signupBloc.add(
                    NextStepEvent(currentStep: state.step),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
