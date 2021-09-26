import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/presentation/screens/customer/customer_main.dart';

import 'customer_main_bloc.dart';
import 'customer_main_state.dart';

class CustomerMainProvider extends BlocProvider<CustomerMainBloc> {
  static const String id = '/cutomer_main';

  CustomerMainProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => CustomerMainBloc(context),
          child: CustomerMainView(),
        );
}

class CustomerMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    return MultiBlocListener(
      listeners: [
        BlocListener<CustomerMainBloc, CustomerMainState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
      ],
      child: CustomerMain(),
    );
  }
}
