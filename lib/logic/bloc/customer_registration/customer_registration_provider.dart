import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/presentation/screens/customer_registration/register_scaffold.dart';

import 'customer_registration_bloc.dart';
import 'customer_registration_state.dart';

class CustomerRegistrationProvider
    extends BlocProvider<CustomerRegistrationBloc> {
  static const String id = '/salesperson_register';

  CustomerRegistrationProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => CustomerRegistrationBloc(context),
          child: CustomerRegistrationView(),
        );
}

class CustomerRegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CustomerRegistrationBloc, CustomerRegistrationState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
      ],
      child: CustomerRegistrationScaffold(),
    );
  }
}
