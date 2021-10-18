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
  static final passwordController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();
  RegExp pwReg = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{6,}$',
  );
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
            text: 'Password',
            fontSize: 24.0,
          ),
          SizedBox(
            height: 30.0,
          ),
          Form(
            key: _formKey,
            child: CommonPadding(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BlocBuilder<SignupBloc, SignupState>(
                    key: Key('pw_text'),
                    builder: (context, state) {
                      passwordController.text = state.salesperson.password;
                      return RoundedTextField(
                        controller: passwordController,
                        hint: 'Password',
                        hideText: true,
                        validation: (String email) {
                          if (email == '' || email == null) {
                            return "Password Field can\'t be empty.";
                          }

                          if (!pwReg.hasMatch(email)) {
                            return "Password must follow the given constraints.";
                          }

                          return null;
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                ],
              ),
            ),
          ),
          CommonPadding(
            child: InfoText(
              text: "1. MUST contain at least 6 characters. "
                  "\n2. MUST contain at least one uppercase letter."
                  "\n3. MUST contain at least one lowercase letter."
                  "\n4. MUST contain at least one number."
                  "\n5. MUST contain at least one special character.\n (!”#\$%&'()*+,-./:;<=>?@[\]^_`{|}~ )."
                  "\n\nPlease make sure to avoid commonly used passwords,further if possible please avoid using "
                  "first name, last name, email address mailbox or domain as your password.",
            ),
          ),
          Spacer(),
          SizedBox(
            height: 20.0,
          ),
          BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              return CommonPadding(
                child: RoundedButton(
                  title: 'Next',
                  titleColor: Colors.white,
                  colour: ColorPrimary,
                  onPressed: () => {
                    if (_formKey.currentState.validate())
                      {
                        signupBloc.add(
                          AddPasswordEvent(password: passwordController.text),
                        ),
                        signupBloc.add(
                          NextStepEvent(currentStep: state.step),
                        ),
                      }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
