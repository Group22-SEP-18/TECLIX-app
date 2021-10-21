import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_late_pay/customer_late_pay_bloc.dart';
import 'package:teclix/logic/bloc/customer_late_pay/customer_late_pay_event.dart';
import 'package:teclix/logic/bloc/customer_late_pay/customer_late_pay_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_back_btn.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/common/widgets/rounded_text_field.dart';
import 'package:teclix/presentation/common/widgets/toast_message.dart';
import 'package:teclix/presentation/screens/customer/customer_late_payment/widget/payment_confirm_dialog_box.dart';
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';

class PaymentDetail extends StatelessWidget {
  static const String id = '/payment-screen';
  static final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final customerLatePayBloc = BlocProvider.of<CustomerLatePayBloc>(context);

    return SafeArea(
      child: BlocListener<CustomerLatePayBloc, CustomerLatePayState>(
        listenWhen: (prev, cur) =>
            prev.paymentFailed != cur.paymentFailed ||
            prev.paymentDone != cur.paymentDone,
        listener: (context, state) {
          if (state.paymentDone) {
            showToast(
              iconSize: 40,
              height: 60.0,
              color: ColorMintGreen,
              text: 'Payment Successfully',
              context: context,
              durationInSec: 2,
            );
            var count = 0;
            Navigator.popUntil(context, (route) {
              return count++ == 3;
            });
          } else if (state.paymentFailed) {
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
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            title: Stack(
              children: [
                Positioned(
                  left: 10.0,
                  top: 0.0,
                  child: HeaderBackButton(
                    whenTapped: () => Navigator.pop(context),
                  ),
                ),
                Align(
                  child: AppbarHeadingText(
                    title: 'Payment Details',
                  ),
                ),
              ],
            ),
          ),
          body: CustomScrollView(
            physics: ClampingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: BlocBuilder<CustomerLatePayBloc, CustomerLatePayState>(
                  buildWhen: (prev, cur) => prev.loading != cur.loading,
                  builder: (context, state) {
                    return state.loading
                        ? Center(
                            child: Container(
                            height: 150.0,
                            width: 150.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorPrimary,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 10.0,
                                ),
                                SizedBox(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                  height: 60.0,
                                  width: 60.0,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Center(
                                  child: Text(
                                    'Processing ...',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ))
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.asset(
                                'static/images/late_payment_image.png',
                                height: 300.0,
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                              CommonPadding(
                                child: Center(
                                  child: Text(
                                    'Amount ',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: ColorPrimary,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              BlocBuilder<CustomerLatePayBloc,
                                  CustomerLatePayState>(
                                buildWhen: (prev, cur) =>
                                    prev.amount != cur.amount ||
                                    prev.checkBoxValue != cur.checkBoxValue,
                                builder: (context, state) {
                                  amountController.text = state.checkBoxValue
                                      ? state.amount.toString()
                                      : '';

                                  return CommonPadding(
                                    child: RoundedTextField(
                                      controller: amountController,
                                      keyboardType: TextInputType.number,
                                      hint: 'Enter Amount',
                                      isEnabled: !state.checkBoxValue,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              CommonPadding(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    BlocBuilder<CustomerLatePayBloc,
                                        CustomerLatePayState>(
                                      builder: (context, state) {
                                        return Transform.scale(
                                          scale: 1.6,
                                          child: Checkbox(
                                            value: state.checkBoxValue,
                                            onChanged: (bool) {
                                              customerLatePayBloc.add(
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
                                      text: 'Pay Full Amount',
                                      fontSize: 18.0,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              CommonPadding(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: InfoText(
                                    text:
                                        'Please uncheck the box to enter desired amount.',
                                  ),
                                ),
                              ),
                              Spacer(),
                              SizedBox(
                                height: 30.0,
                              ),
                              CommonPadding(
                                child: BlocBuilder<CustomerLatePayBloc,
                                    CustomerLatePayState>(
                                  builder: (context, state) {
                                    return RoundedButton(
                                        title: 'Confirm Payment',
                                        titleColor: Colors.white,
                                        colour: ColorPrimary,
                                        onPressed: () {
                                          if (amountController.text.isEmpty) {
                                            showToast(
                                              isError: true,
                                              iconSize: 40,
                                              height: 60.0,
                                              color: ColorToastRed,
                                              text: 'Please enter amount.',
                                              context: context,
                                              durationInSec: 5,
                                            );
                                          } else if (double.parse(
                                                  amountController.text) >
                                              double.parse(state.amount)) {
                                            showToast(
                                              isError: true,
                                              iconSize: 40,
                                              height: 60.0,
                                              color: ColorToastRed,
                                              text:
                                                  'you can\'t pay more than current outstanding.',
                                              context: context,
                                              durationInSec: 5,
                                            );
                                          } else {
                                            showPayConfirmDialog(context)
                                                .then((val) {
                                              if (val) {
                                                customerLatePayBloc.add(
                                                  SubmitLatePayEvent(
                                                    data: {
                                                      "amount":
                                                          state.checkBoxValue
                                                              ? state.amount
                                                              : amountController
                                                                  .text,
                                                      "customer":
                                                          state.customerId,
                                                    },
                                                  ),
                                                );
                                              }
                                            });
                                          }
                                        });
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 25.0,
                              ),
                            ],
                          );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
