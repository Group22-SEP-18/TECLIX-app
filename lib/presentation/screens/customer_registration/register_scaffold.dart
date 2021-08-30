import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_event.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_state.dart';
import 'package:teclix/presentation/common/widgets/animated_page_switcher.dart';
import 'package:teclix/presentation/common/widgets/appbar_back_btn.dart';

class CustomerRegistrationScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customerRegisterBloc =
        BlocProvider.of<CustomerRegistrationBloc>(context);
    return BlocBuilder<CustomerRegistrationBloc, CustomerRegistrationState>(
      buildWhen: (previous, current) => previous.step != current.step,
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () {
            customerRegisterBloc.add(
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
                        whenTapped: () => customerRegisterBloc.add(
                          PreviousStepEvent(
                              currentStep: state.step, context: context),
                        ),
                      ),
                    ),
                    Align(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              body: CustomScrollView(
                  physics:
                      state.step == CustomerRegProcessSteps.CUSTOMER_REG_START
                          ? NeverScrollableScrollPhysics()
                          : ClampingScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Container(
                        child: getAnimatedPageSwitcher(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              pageSwitcher(state.step),
                              SizedBox(
                                height: state.step ==
                                        CustomerRegProcessSteps
                                            .CUSTOMER_REG_FINISH
                                    ? 22.0
                                    : 43.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
            ),
          ),
        );
      },
    );
  }
}

Widget pageSwitcher(CustomerRegProcessSteps step) {
  switch (step) {
    case CustomerRegProcessSteps.CUSTOMER_REG_START:
      // TODO: Handle this case.
      break;
    case CustomerRegProcessSteps.CUSTOMER_REG_BASIC_DETAILS:
      // TODO: Handle this case.
      break;
    case CustomerRegProcessSteps.CUSTOMER_REG_CONTACT_DETAILS:
      // TODO: Handle this case.
      break;
    case CustomerRegProcessSteps.CUSTOMER_REG_ADDRESS:
      // TODO: Handle this case.
      break;
    case CustomerRegProcessSteps.CUSTOMER_REG_FINISH:
      // TODO: Handle this case.
      break;
    default:
      // TODO: Handle this case.
      break;
  }
}
