import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_event.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/text_button.dart';
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class CustomerRegisterFinish extends StatelessWidget {
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
                  text:
                      " 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper nulla ex, "
                      "vitae tempus lacus condimentum vel. Praesent semper, "
                      "lectus in dictum scelerisque, erat Leo viverra sem, non sagittis est diam ut nisl',",
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            children: [
              BlocBuilder<CustomerRegistrationBloc, CustomerRegistrationState>(
                builder: (context, state) {
                  return CommonPadding(
                    child: RoundedButton(
                      title: 'Finish',
                      titleColor: Colors.white,
                      colour: ColorPrimary,
                      onPressed: () => customerRegisterBloc.add(
                        NextStepEvent(currentStep: state.step),
                      ),
                    ),
                  );
                },
              ),
              TextBtn(text: 'Cancel'),
            ],
          ),
        ],
      ),
    );
  }
}
