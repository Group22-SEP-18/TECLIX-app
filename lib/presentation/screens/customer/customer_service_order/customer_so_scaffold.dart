import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_event.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_bloc.dart';
import 'package:teclix/logic/bloc/customer_so/customer_so_state.dart';
import 'package:teclix/presentation/common/widgets/animated_page_switcher.dart';
import 'package:teclix/presentation/common/widgets/appbar_back_btn.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/customer_so_customer_details.dart';

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
                      child: AppbarHeadingText(
                        title: 'Service Order',
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
                    child: Container(
                      child: getAnimatedPageSwitcher(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [],
                        ),
                      ),
                    ),
                  )
                ],
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
      // TODO: Handle this case.
      break;
    case CustomerSOProcessSteps.SO_CART:
      // TODO: Handle this case.
      break;
    case CustomerSOProcessSteps.SO_INVOICE:
      // TODO: Handle this case.
      break;
    case CustomerSOProcessSteps.SO_PAY:
      // TODO: Handle this case.
      break;
    default:
      break;
  }
}
