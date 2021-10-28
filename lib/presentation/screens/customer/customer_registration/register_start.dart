import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_event.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_state.dart';

import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class CustomerRegisterStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customerRegisterBloc =
        BlocProvider.of<CustomerRegistrationBloc>(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                height: 400.0,
                child: Image.asset('static/images/customer_reg.png'),
              ),
              MainHeading(
                text: "Register Customer",
                fontSize: 30.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              CommonPadding(
                child: InfoText(
                  text:
                      "Welcome!\nPlease note that registering customers without customer\'s consent is against our company policies."
                      "\nPlease note that, all the fields are required to complete the registration flow unless specified otherwise.",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Column(
            children: [
              BlocBuilder<CustomerRegistrationBloc, CustomerRegistrationState>(
                builder: (context, state) {
                  return CommonPadding(
                    child: RoundedButton(
                      title: 'Add a New Customer',
                      titleColor: Colors.white,
                      colour: ColorPrimary,
                      onPressed: () => customerRegisterBloc.add(
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
