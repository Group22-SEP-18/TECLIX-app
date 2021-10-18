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
  static final firstNameController = TextEditingController();
  static final lastNameController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();

  RegExp nameReg = RegExp(
    r'[A-Z]',
    caseSensitive: false,
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
            text: 'Name',
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
                    key: Key('fn_text'),
                    builder: (context, state) {
                      firstNameController.text = state.salesperson.firstName;
                      return RoundedTextField(
                        controller: firstNameController,
                        hint: 'First Name',
                        validation: (String fname) {
                          if (fname == '' || fname == null) {
                            return "First name can\'t be empty.";
                          }
                          if (!nameReg.hasMatch(fname)) {
                            return "The first name should only contain letters";
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  BlocBuilder<SignupBloc, SignupState>(
                    key: Key('ln_text'),
                    builder: (context, state) {
                      lastNameController.text = state.salesperson.lastName;
                      return RoundedTextField(
                        controller: lastNameController,
                        hint: 'Last Name',
                        validation: (String lname) {
                          if (lname == '' || lname == null) {
                            return "Last name can\'t be empty.";
                          }
                          if (!nameReg.hasMatch(lname)) {
                            return "The first name should only contain letters";
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
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
                  onPressed: () => {
                    if (_formKey.currentState.validate())
                      {
                        signupBloc.add(
                          AddNameEvent(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                          ),
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
