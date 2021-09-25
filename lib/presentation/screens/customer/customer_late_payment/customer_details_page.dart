import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_late_pay/customer_late_pay_bloc.dart';
import 'package:teclix/logic/bloc/customer_late_pay/customer_late_pay_event.dart';
import 'package:teclix/logic/bloc/customer_late_pay/customer_late_pay_state.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_bloc.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_back_btn.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/screens/customer/customer_late_payment/payment_details.dart';
import 'package:teclix/presentation/screens/customer/widgets/customer_details_card.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';
import 'package:intl/intl.dart';

class CustomerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customerLatePayBloc = BlocProvider.of<CustomerLatePayBloc>(context);
    String amount = '0.00';
    int cusId = 0;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<SearchCustomerBloc, SearchCustomerState>(
                buildWhen: (prev, cur) => prev.selectedCus != cur.selectedCus,
                builder: (context, state) {
                  return CustomerDetailsCard(
                    borderTop: 0.0,
                    profilePic: state.selectedCus.profilePicture,
                    shop: state.selectedCus.shopName,
                    owner: state.selectedCus.ownerFirstName +
                        ' ' +
                        state.selectedCus.ownerLastName,
                    street: state.selectedCus.street,
                    city: state.selectedCus.city,
                    district: state.selectedCus.district,
                  );
                },
              ),
              SizedBox(
                height: 40.0,
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
                    child: BlocBuilder<SearchCustomerBloc, SearchCustomerState>(
                      buildWhen: (prev, cur) =>
                          prev.selectedCus.outstanding !=
                          cur.selectedCus.outstanding,
                      builder: (context, state) {
                        amount = state.selectedCus.outstanding;
                        cusId = state.selectedCus.id;
                        return Text(
                          NumberFormat.currency(name: 'Rs ').format(
                              double.parse(state.selectedCus.outstanding)),
                          style: TextStyle(
                              fontSize: 45.0,
                              color: ColorPrimary,
                              fontWeight: FontWeight.w500),
                        );
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              CommonPadding(
                child: BlocBuilder<CustomerLatePayBloc, CustomerLatePayState>(
                  builder: (context, state) {
                    return RoundedButton(
                      title: 'Pay',
                      titleColor: Colors.white,
                      colour: ColorPrimary,
                      onPressed: () {
                        customerLatePayBloc.add(
                          SetSelctedCustomerEvent(
                              amount: amount, customerId: cusId),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
