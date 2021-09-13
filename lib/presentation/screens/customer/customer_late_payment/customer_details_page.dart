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
import 'package:teclix/presentation/screens/customer/customer_late_payment/payment_details.dart';
import 'package:teclix/presentation/screens/customer/widgets/customer_details_card.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class CustomerDetails extends StatelessWidget {
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
                  title: 'Customer Details',
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: CommonPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                CustomerDetailsCard(
                  profilePic: 'static/images/profile_dummy.jpg',
                  shop: 'Gamini Stores (Pvt) Ltd',
                  owner: 'Owner Name',
                  street: '4A , hilda lane',
                  city: 'Dehiwala',
                  district: 'Colombo',
                ),
                SizedBox(
                  height: 20.0,
                ),
                MainHeading(
                  text: 'Current Outstanding',
                  fontSize: 25.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 250,
                        child: Image.asset(
                          'static/images/coins.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Rs 25,600',
                        style: TextStyle(
                            fontSize: 45.0,
                            color: ColorPrimary,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                BlocBuilder<CustomerLatePayBloc, CustomerLatePayState>(
                  builder: (context, state) {
                    return RoundedButton(
                      title: 'Pay',
                      titleColor: Colors.white,
                      colour: ColorPrimary,
                      onPressed: () {
                        //:TODO make the value dynamic
                        customerLatePayBloc.add(
                          SetDebtAmountEvent(amount: 25000.00),
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => BlocProvider.value(
                              value: customerLatePayBloc,
                              child: PaymentDetail(),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
