import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_event.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/utils.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_outline_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_text_field.dart';
import 'package:teclix/presentation/common/widgets/toast_message.dart';
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';

class CustomerSoPay extends StatelessWidget {
  static final pointsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final customerSoBloc = BlocProvider.of<CustomerSoBloc>(context);

    return BlocListener<CustomerSoBloc, CustomerSoState>(
      listenWhen: (prev, cur) =>
          prev.postingFailed != cur.postingFailed ||
          prev.postingDone != cur.postingDone,
      listener: (context, state) {
        if (state.postingDone) {
          showToast(
            iconSize: 40,
            height: 60.0,
            color: ColorMintGreen,
            text: 'Service order Created Successfully',
            context: context,
            durationInSec: 3,
          );
          var count = 0;
          Navigator.popUntil(context, (route) {
            return count++ == 2;
          });
        } else if (state.postingFailed) {
          showToast(
            isError: true,
            iconSize: 40,
            height: 60.0,
            color: ColorToastRed,
            text: 'Sorry, Something went wrong!!!',
            context: context,
            durationInSec: 5,
          );
        }
      },
      child: BlocBuilder<CustomerSoBloc, CustomerSoState>(
        buildWhen: (prev, cur) => prev.postingSo != cur.postingSo,
        builder: (context, state) {
          return state.postingSo
              ? Center(
                  child: Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: CircularProgressIndicator(),
                ))
              : Expanded(
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
                      BlocBuilder<CustomerSoBloc, CustomerSoState>(
                        buildWhen: (prev, cur) =>
                            prev.totalAmount != cur.totalAmount,
                        builder: (context, state) {
                          return Center(
                            child: Text(
                              Utils.returnCurrency(state.totalAmount, 'Rs '),
                              style: TextStyle(
                                color: ColorPrimary,
                                fontSize: 45.0,
                              ),
                            ),
                          );
                        },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      BlocBuilder<CustomerSoBloc,
                                          CustomerSoState>(
                                        builder: (context, state) {
                                          return Transform.scale(
                                            scale: 1.5,
                                            child: Checkbox(
                                              value: state.checkBoxValue,
                                              onChanged: (bool) {
                                                customerSoBloc.add(
                                                    ToggleCheckBoxEvent(
                                                        isSelected: !state
                                                            .checkBoxValue));
                                              },
                                              side: BorderSide(
                                                  color: ColorMintGreen,
                                                  width: 1.5),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
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
                              onPressed: () => {
                                if (state.redeem)
                                  {
                                    if (pointsController.text.isEmpty)
                                      {
                                        showToast(
                                          isError: true,
                                          iconSize: 40,
                                          height: 60.0,
                                          color: ColorToastRed,
                                          text: 'Please enter amount.',
                                          context: context,
                                          durationInSec: 3,
                                        ),
                                      }
                                    else if (state.totalAmount <
                                        double.parse(pointsController.text))
                                      {
                                        showToast(
                                          isError: true,
                                          iconSize: 40,
                                          height: 60.0,
                                          color: ColorToastRed,
                                          text:
                                              'Discount can\'t be higher than the order amount.',
                                          context: context,
                                          durationInSec: 3,
                                        ),
                                      }
                                    else if (state.loyaltyPoints <
                                        double.parse(pointsController.text))
                                      {
                                        showToast(
                                          isError: true,
                                          iconSize: 40,
                                          height: 60.0,
                                          color: ColorToastRed,
                                          text:
                                              'Exceeds the avalible loyalty points balance.',
                                          context: context,
                                          durationInSec: 3,
                                        ),
                                      }
                                    else if (double.parse(
                                            pointsController.text) <
                                        0)
                                      {
                                        showToast(
                                          isError: true,
                                          iconSize: 40,
                                          height: 60.0,
                                          color: ColorToastRed,
                                          text:
                                              'Discount can\'t ne a negative value.',
                                          context: context,
                                          durationInSec: 3,
                                        ),
                                      }
                                    else
                                      {
                                        customerSoBloc.add(
                                            SetLoyaltyPointsEvent(
                                                amount: double.parse(
                                                    pointsController.text))),
                                        customerSoBloc.add(CreateSo())
                                      }
                                  }
                                else
                                  {
                                    customerSoBloc.add(
                                        SetLoyaltyPointsEvent(amount: 0.00)),
                                    customerSoBloc.add(CreateSo())
                                  },
                              },
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
        },
      ),
    );
  }
}
