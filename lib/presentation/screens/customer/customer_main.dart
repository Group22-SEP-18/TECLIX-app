import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_main/customer_main_bloc.dart';
import 'package:teclix/logic/bloc/customer_main/customer_main_event.dart';
import 'package:teclix/logic/bloc/customer_main/customer_main_state.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_provider.dart';
import 'package:teclix/logic/bloc/internet/internet_bloc.dart';
import 'package:teclix/logic/bloc/internet/internet_event.dart';
import 'package:teclix/logic/bloc/internet/internet_state.dart';
import 'package:teclix/logic/bloc/root/root_bloc.dart';
import 'package:teclix/logic/bloc/root/root_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/utils.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/internet_connection_dialog.dart';
import 'package:teclix/presentation/routing/routes.dart';
import 'package:teclix/presentation/screens/customer/customer_late_payment/customer_late_payment_search_page.dart';
import 'package:teclix/presentation/screens/customer/customer_profile/customer_view_search_page.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/customer_so_search_page.dart';
import 'package:teclix/presentation/screens/customer/widgets/customer_main_clip_path.dart';
import 'package:teclix/presentation/screens/customer/widgets/option_card.dart';
import 'package:teclix/presentation/screens/customer/widgets/stat_row_card.dart';

class CustomerMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customerMainBloc = BlocProvider.of<CustomerMainBloc>(context);
    final internetBloc = BlocProvider.of<InternetBloc>(context);

    return SafeArea(
      child: BlocListener<InternetBloc, InternetState>(
        listenWhen: (prev, cur) => prev.status != cur.status,
        listener: (context, state) {
          if (state.status == InternetConnection.DISCONNECTED) {
            showInternetConnectionDialog(context);
          } else if (state.status == InternetConnection.CONNECTED &&
              !state.initialChecking) {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          }
          internetBloc.add(ToggleIntialChecking(isInitial: false));
        },
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
          body: CommonPadding(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  BlocBuilder<RootBloc, RootState>(
                    builder: (context, state) {
                      return Padding(
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
                      );
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Today\'s Stats',
                          style: TextStyle(
                              fontSize: 23.0,
                              color: ColorPrimary,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            customerMainBloc.add(FetchDailyStatEvent()),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: Icon(
                            Icons.refresh_rounded,
                            color: ColorPrimary,
                            size: 35.0,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  BlocBuilder<CustomerMainBloc, CustomerMainState>(
                    buildWhen: (prev, cur) =>
                        prev.loadingData != cur.loadingData,
                    builder: (context, state) {
                      return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: ColorPrimary),
                        ),
                        elevation: 5,
                        child: Container(
                          child: state.loadingData
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 30.0),
                                  child: Center(
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 50.0,
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                )
                              : Column(
                                  children: [
                                    StatRowCard(
                                      statAttr: 'Stores Visited:',
                                      statValue: state.dailyStats.shops
                                          .toString()
                                          .padLeft(2, '0'),
                                    ),
                                    StatRowCard(
                                      statAttr: 'Payments Collected:',
                                      statValue: state.dailyStats.payCount
                                          .toString()
                                          .padLeft(2, '0'),
                                    ),
                                    StatRowCard(
                                      statAttr: 'Total Sales:',
                                      statValue:
                                          state.dailyStats.totalSales != null
                                              ? Utils.returnCurrency(
                                                  state.dailyStats.totalSales,
                                                  'Rs ')
                                              : '0.00',
                                    ),
                                  ],
                                ),
                        ),
                      );
                    },
                  ),
                  // TodaysStats(),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
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
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
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
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
