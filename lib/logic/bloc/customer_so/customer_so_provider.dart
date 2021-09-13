import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/presentation/screens/customer/customer_service_order/customer_so_scaffold.dart';

import 'customer_so_bloc.dart';
import 'customer_so_state.dart';

class CustomerSoProvider extends BlocProvider<CustomerSoBloc> {
  static const String id = '/customer-so';

  CustomerSoProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => CustomerSoBloc(context),
          child: CustomerSoView(),
        );
}

class CustomerSoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CustomerSoBloc, CustomerSoState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
      ],
      child: CustomerSoScaffold(),
    );
  }
}
