import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/presentation/screens/customer/customer_late_payment/customer_details_page.dart';

import 'customer_late_pay_bloc.dart';
import 'customer_late_pay_state.dart';

class CustomerLatePayProvider extends BlocProvider<CustomerLatePayBloc> {
  static const String id = '/customer-late-pay';

  CustomerLatePayProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => CustomerLatePayBloc(context),
          child: CustomerLatePayView(),
        );
}

class CustomerLatePayView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CustomerLatePayBloc, CustomerLatePayState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
      ],
      child: CustomerDetails(),
    );
  }
}
