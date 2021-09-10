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
import 'package:teclix/presentation/screens/customer/customer_late_payment/widget/payment_confirm_dialog_box.dart';
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';

class PaymentDetail extends StatelessWidget {
  static const String id = '/payment-screen';
  static final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final customerLatePayBloc = BlocProvider.of<CustomerLatePayBloc>(context);

    return SafeArea(
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
              child: Column(
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
                  BlocBuilder<CustomerLatePayBloc, CustomerLatePayState>(
                    buildWhen: (prev, cur) =>
                        prev.amount != cur.amount ||
                        prev.checkBoxValue != cur.checkBoxValue,
                    builder: (context, state) {
                      amountController.text =
                          state.checkBoxValue ? state.amount.toString() : '';

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
                        BlocBuilder<CustomerLatePayBloc, CustomerLatePayState>(
                          builder: (context, state) {
                            return Transform.scale(
                              scale: 1.6,
                              child: Checkbox(
                                value: state.checkBoxValue,
                                onChanged: (bool) {
                                  customerLatePayBloc.add(ToggleCheckBoxEvent(
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
                        text: 'Please uncheck the box to enter desired amount.',
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 30.0,
                  ),
                  CommonPadding(
                    child: RoundedButton(
                        title: 'Confirm Payment',
                        titleColor: Colors.white,
                        colour: ColorPrimary,
                        onPressed: () {
                          showPayConfirmDialog(context);
                        }),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}