import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_event.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_outline_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_text_field.dart';
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';

class CustomerSoPay extends StatelessWidget {
  static final pointsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final customerSoBloc = BlocProvider.of<CustomerSoBloc>(context);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset('static/images/so_pay_last.png'),
          Center(
            child: Text(
              'Total Amount',
              style: TextStyle(
                color: ColorHeadingFont,
                fontSize: 20.0,
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Center(
            child: Text(
              'Rs 12,500',
              style: TextStyle(
                color: ColorPrimary,
                fontSize: 45.0,
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          BlocBuilder<CustomerSoBloc, CustomerSoState>(
            buildWhen: (prev, cur) => prev.redeem != cur.redeem,
            builder: (context, state) {
              return Visibility(
                visible: state.redeem,
                child: Column(
                  children: [
                    BlocBuilder<CustomerSoBloc, CustomerSoState>(
                      buildWhen: (prev, cur) =>
                          prev.loyaltyPoints != cur.loyaltyPoints ||
                          prev.checkBoxValue != cur.checkBoxValue,
                      builder: (context, state) {
                        pointsController.text = state.checkBoxValue
                            ? state.loyaltyPoints.toString()
                            : '';

                        return CommonPadding(
                          child: RoundedTextField(
                            controller: pointsController,
                            keyboardType: TextInputType.number,
                            hint: 'Enter Value',
                            isEnabled: !state.checkBoxValue,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    CommonPadding(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BlocBuilder<CustomerSoBloc, CustomerSoState>(
                            builder: (context, state) {
                              return Transform.scale(
                                scale: 1.5,
                                child: Checkbox(
                                  value: state.checkBoxValue,
                                  onChanged: (bool) {
                                    customerSoBloc.add(ToggleCheckBoxEvent(
                                        isSelected: !state.checkBoxValue));
                                  },
                                  side: BorderSide(
                                      color: ColorMintGreen, width: 1.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              );
                            },
                          ),
                          InfoText(
                            text: 'Redeem all the Points',
                            fontSize: 18.0,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          Spacer(),
          CommonPadding(
            child: BlocBuilder<CustomerSoBloc, CustomerSoState>(
              buildWhen: (prev, cur) => prev.redeem != cur.redeem,
              builder: (context, state) {
                return RoundedOutlineButton(
                  title: state.redeem
                      ? 'Don\'t Redeem Loyalty Points'
                      : 'Redeem Loyalty Points',
                  borderColor: ColorLightGreen,
                  fillColor: Colors.white,
                  titleColor: ColorPrimary,
                  //:TODO go to the main page fix
                  onPressed: () => {
                    customerSoBloc.add(
                      ToggleredeemEvent(isSelected: !state.redeem),
                    ),
                  },
                );
              },
            ),
          ),
          BlocBuilder<CustomerSoBloc, CustomerSoState>(
            builder: (context, state) {
              return CommonPadding(
                child: RoundedButton(
                  padding: 8.0,
                  title: 'Confirm Payment',
                  titleColor: Colors.white,
                  colour: ColorPrimary,
                  onPressed: () => {},
                ),
              );
            },
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
