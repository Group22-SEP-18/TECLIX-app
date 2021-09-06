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
                text: "Register A Customer",
                fontSize: 30.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              CommonPadding(
                child: InfoText(
                  text:
                      " 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper nulla ex, "
                      "vitae tempus lacus condimentum vel. Praesent semper, "
                      "lectus in dictum scelerisque, erat Leo viverra sem, non sagittis est diam ut nisl',",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
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
