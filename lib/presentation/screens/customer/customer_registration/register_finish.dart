import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_event.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/text_button.dart';
import 'package:teclix/presentation/common/widgets/toast_message.dart';
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class CustomerRegisterFinish extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customerRegisterBloc =
        BlocProvider.of<CustomerRegistrationBloc>(context);

    return BlocListener<CustomerRegistrationBloc, CustomerRegistrationState>(
      listenWhen: (prev, cur) =>
          prev.registerDone != cur.registerDone ||
          prev.registerErr != cur.registerErr,
      listener: (context, state) {
        if (state.registerDone) {
          showToast(
            iconSize: 40,
            height: 60.0,
            color: ColorMintGreen,
            text: 'Registered Successfully',
            context: context,
            durationInSec: 2,
          );
          new Timer(new Duration(milliseconds: 500), () {
            var count = 0;
            Navigator.popUntil(context, (route) {
              return count++ == 1;
            });
          });
        } else if (state.registerErr != '') {
          showToast(
            isError: true,
            iconSize: 40,
            height: 60.0,
            color: ColorToastRed,
            text: state.registerErr,
            context: context,
            durationInSec: 5,
          );
        }
      },
      child: Expanded(
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
                        "Please note that, upon confirmation the customer account will be created and it is irreversible. Please contact relevant authorities, "
                        "if any assitance is required.",
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                BlocBuilder<CustomerRegistrationBloc,
                    CustomerRegistrationState>(
                  buildWhen: (prev, cur) => prev.loading != cur.loading,
                  builder: (context, state) {
                    return Visibility(
                      visible: state.loading,
                      child: SizedBox(
                        width: 80,
                        height: 80.0,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  },
                )
              ],
            ),
            Spacer(),
            Column(
              children: [
                BlocBuilder<CustomerRegistrationBloc,
                    CustomerRegistrationState>(
                  builder: (context, state) {
                    return CommonPadding(
                      child: RoundedButton(
                          title: 'Finish',
                          titleColor: Colors.white,
                          colour: ColorPrimary,
                          onPressed: () => {
                                customerRegisterBloc.add(SubmitRegisterEvent(
                                    customer: state.customer))
                              }),
                    );
                  },
                ),
                TextBtn(
                  text: 'Cancel',
                  onClick: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
