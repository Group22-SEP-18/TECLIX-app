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

class SignupEmpDetails extends StatelessWidget {
  static final emailController = TextEditingController();
  static final empNoController = TextEditingController();
  static final contactNoController = TextEditingController();

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
            text: 'Employee Details',
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
                    emailController.text = state.salesperson.email;
                    return RoundedTextField(
                      controller: emailController,
                      hint: 'Email',
                    );
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<SignupBloc, SignupState>(
                  builder: (context, state) {
                    empNoController.text = state.salesperson.employeeNo;
                    return RoundedTextField(
                      controller: empNoController,
                      hint: 'Employee Number',
                    );
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<SignupBloc, SignupState>(
                  builder: (context, state) {
                    contactNoController.text = state.salesperson.contactNo;
                    return RoundedTextField(
                      keyboardType: TextInputType.number,
                      controller: contactNoController,
                      hint: 'Contact Number',
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
                  onPressed: () => {
                    signupBloc.add(
                      AddEmployeeDetialsEvent(
                        email: emailController.text,
                        employeeNo: empNoController.text,
                        contactNo: contactNoController.text,
                      ),
                    ),
                    signupBloc.add(
                      NextStepEvent(currentStep: state.step),
                    ),
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
