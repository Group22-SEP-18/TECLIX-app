import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_event.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/animated_page_switcher.dart';
import 'package:teclix/presentation/common/widgets/appbar_back_btn.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/customer_so_add_item.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/customer_so_cart.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/customer_so_customer_details.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/customer_so_invoice.dart';

class CustomerSoScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customerSoBloc = BlocProvider.of<CustomerSoBloc>(context);

    return BlocBuilder<CustomerSoBloc, CustomerSoState>(
      buildWhen: (previous, current) => previous.step != current.step,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            customerSoBloc.add(
                PreviousStepEvent(currentStep: state.step, context: context));
            return;
          },
          child: SafeArea(
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
                        whenTapped: () => customerSoBloc.add(
                          PreviousStepEvent(
                              currentStep: state.step, context: context),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: AppbarHeadingText(
                        title: 'Service Order',
                      ),
                    ),
                    Visibility(
                      visible:
                          state.step == CustomerSOProcessSteps.SO_ADD_ITEMS ||
                              state.step == CustomerSOProcessSteps.SO_CART,
                      child: BlocBuilder<CustomerSoBloc, CustomerSoState>(
                        buildWhen: (prev, cur) =>
                            prev.itemCount != cur.itemCount,
                        builder: (context, state) {
                          return Positioned(
                            right: 20.0,
                            top: 0.0,
                            bottom: 0.0,
                            child: Badge(
                              showBadge: state.itemCount != 0,
                              shape: BadgeShape.circle,
                              position: BadgePosition.topStart(
                                top: 5,
                              ),
                              animationType: BadgeAnimationType.slide,
                              badgeColor: ColorBlue,
                              badgeContent: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  state.itemCount.toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              child: Icon(
                                Icons.shopping_cart,
                                size: 37.0,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              body: CustomScrollView(
                physics: ClampingScrollPhysics(),
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Container(
                      child: getAnimatedPageSwitcher(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            pageSwitcher(state.step),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              bottomNavigationBar: Visibility(
                visible: state.step == CustomerSOProcessSteps.SO_ADD_ITEMS ||
                    state.step == CustomerSOProcessSteps.SO_CART,
                child: Container(
                  height: 70.0,
                  child: BlocBuilder<CustomerSoBloc, CustomerSoState>(
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CommonPadding(
                            child: RoundedButton(
                              padding: 8.0,
                              title: state.step ==
                                      CustomerSOProcessSteps.SO_ADD_ITEMS
                                  ? 'View Cart'
                                  : 'Confirm Order',
                              titleColor: Colors.white,
                              colour: ColorPrimary,
                              onPressed: () => {
                                print(state.step),
                                customerSoBloc.add(
                                  NextStepEvent(currentStep: state.step),
                                ),
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget pageSwitcher(CustomerSOProcessSteps step) {
  switch (step) {
    case CustomerSOProcessSteps.CUSTOMER_DETAILS:
      return SOCustomerDetails();
      break;
    case CustomerSOProcessSteps.SO_ADD_ITEMS:
      return SoAddItem();
      break;
    case CustomerSOProcessSteps.SO_CART:
      return CustomerSoCart();
      break;
    case CustomerSOProcessSteps.SO_INVOICE:
      return CustomerSoInvoice();
      break;
    case CustomerSOProcessSteps.SO_PAY:
      // TODO: Handle this case.
      break;
    default:
      break;
  }
}
