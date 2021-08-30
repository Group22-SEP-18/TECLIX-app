import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_event.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_text_field.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class CustomerRegisterStoreDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customerRegisterBloc =
        BlocProvider.of<CustomerRegistrationBloc>(context);
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 65.0,
          ),
          MainHeading(
            text: 'Store Details',
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
                BlocBuilder<CustomerRegistrationBloc,
                    CustomerRegistrationState>(
                  builder: (context, state) {
                    return RoundedTextField(
                      hint: 'Store Name',
                    );
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                BlocBuilder<CustomerRegistrationBloc,
                    CustomerRegistrationState>(
                  builder: (context, state) {
                    return RoundedTextField(
                      hint: 'Email',
                    );
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
                BlocBuilder<CustomerRegistrationBloc,
                    CustomerRegistrationState>(
                  builder: (context, state) {
                    return RoundedTextField(
                      hint: 'Contact Number',
                    );
                  },
                ),
                SizedBox(
                  height: 25.0,
                ),
              ],
            ),
          ),
          Spacer(),
          BlocBuilder<CustomerRegistrationBloc, CustomerRegistrationState>(
            builder: (context, state) {
              return CommonPadding(
                child: RoundedButton(
                  title: 'Next',
                  titleColor: Colors.white,
                  colour: ColorPrimary,
                  onPressed: () => {
                    customerRegisterBloc.add(
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
