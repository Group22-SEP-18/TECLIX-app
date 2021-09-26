import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_provider.dart';
import 'package:teclix/logic/bloc/root/root_bloc.dart';
import 'package:teclix/logic/bloc/root/root_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/routing/routes.dart';
import 'package:teclix/presentation/screens/customer/customer_late_payment/customer_late_payment_search_page.dart';
import 'package:teclix/presentation/screens/customer/customer_profile/customer_view_search_page.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/customer_so_search_page.dart';
import 'package:teclix/presentation/screens/customer/widgets/customer_main_clip_path.dart';
import 'package:teclix/presentation/screens/customer/widgets/option_card.dart';
import 'package:teclix/presentation/screens/customer/widgets/stat_row_card.dart';

class CustomerMain extends StatelessWidget {
  static const String id = '/cutomer_main';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: ClipPath(
            clipper: CustomerMainClipPath(),
            child: Container(
              color: ColorPrimary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  Center(
                    child: AppbarHeadingText(
                      title: 'Dashboard',
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30.0,
              ),
              BlocBuilder<RootBloc, RootState>(
                builder: (context, state) {
                  return CommonPadding(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Welcome Back, ' +
                            state.loggedUser.firstName +
                            ' ' +
                            state.loggedUser.lastName,
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w400,
                            color: ColorDarkGreen),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonPadding(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Text(
                        'Today\'s Stats',
                        style: TextStyle(
                            fontSize: 23.0,
                            color: ColorPrimary,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Icon(
                      Icons.refresh_rounded,
                      color: ColorPrimary,
                      size: 35.0,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              CommonPadding(
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: ColorPrimary),
                  ),
                  elevation: 5,
                  child: Container(
                    child: Column(
                      children: [
                        StatRowCard(
                          statAttr: 'Stores visited:',
                          statValue: '21',
                        ),
                        StatRowCard(
                          statAttr: 'Payments Collected:',
                          statValue: '05',
                        ),
                        StatRowCard(
                          statAttr: 'Total Sales:',
                          statValue: 'Rs. 25,000',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // TodaysStats(),
              SizedBox(
                height: 30.0,
              ),
              CommonPadding(
                child: Row(
                  children: [
                    Expanded(
                      child: ProfileOptionCard(
                        coverColor: ColorMintGreen,
                        image: 'static/images/create_cus_acc.png',
                        optionText: 'Create Account',
                        onClick: () => Navigator.of(context).push(
                          Routes.getMaterialPageRoute(
                              CustomerRegistrationProvider.id, context),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ProfileOptionCard(
                        coverColor: ColorOrange,
                        image: 'static/images/view_cus_acc.png',
                        optionText: 'View Account',
                        onClick: () => Navigator.of(context).push(
                          Routes.getMaterialPageRoute(
                              CustomerViewSearchPage.id, context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CommonPadding(
                child: Row(
                  children: [
                    Expanded(
                      child: ProfileOptionCard(
                        coverColor: ColorBlue,
                        image: 'static/images/so.png',
                        optionText: 'Create SO',
                        onClick: () => Navigator.of(context).push(
                          Routes.getMaterialPageRoute(
                              CustomerSoSearchPage.id, context),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ProfileOptionCard(
                        coverColor: ColorToastRed,
                        image: 'static/images/late_pay.png',
                        optionText: 'Late Payment',
                        onClick: () => Navigator.of(context).push(
                          Routes.getMaterialPageRoute(
                              CustomerLatePaymentSearchPage.id, context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
