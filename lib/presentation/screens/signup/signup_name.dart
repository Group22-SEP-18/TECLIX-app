import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_event.dart';
import 'package:teclix/logic/bloc/signup/signup_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_text_field.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class SignupName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signupBloc = BlocProvider.of<SignupBloc>(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 65.0,
          ),
          MainHeading(
            text: 'Name',
            fontSize: 24.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          CommonPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BlocBuilder<SignupBloc, SignupState>(
                  builder: (context, state) {
                    return RoundedTextField(
                      hint: 'First Name',
                    );
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<SignupBloc, SignupState>(
                  builder: (context, state) {
                    return RoundedTextField(
                      hint: 'Last Name',
                    );
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
          Spacer(),
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
