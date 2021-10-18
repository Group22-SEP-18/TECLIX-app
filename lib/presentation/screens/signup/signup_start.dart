import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_event.dart';
import 'package:teclix/logic/bloc/signup/signup_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class SignupStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final signupBloc = BlocProvider.of<SignupBloc>(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                //temp
                child: Image.asset('static/images/test.png'),
              ),
              MainHeading(
                text: "Welcome!",
                fontSize: 30.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              CommonPadding(
                child: InfoText(
                    fontSize: 18.0,
                    text:
                        'The entire team of TECLIX is thrilled to welcome you on board. '
                        'We hope you’ll do some amazing works here. Please note that this app is intended for employees of TECLIX,'
                        ' any unauthorized personnel will not be able to access the app. \n -- Team TECLIX --'),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              BlocBuilder<SignupBloc, SignupState>(
                builder: (context, state) {
                  return CommonPadding(
                    child: RoundedButton(
                      title: 'Create Account',
                      titleColor: Colors.white,
                      colour: ColorPrimary,
                      onPressed: () => signupBloc.add(
                        NextStepEvent(currentStep: state.step),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 13.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
