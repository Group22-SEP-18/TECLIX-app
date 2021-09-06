import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/presentation/screens/customer/customer_profile/search_bar_page.dart';

import 'search_customer_bloc.dart';
import 'search_customer_state.dart';

class SearchCustomerProvider extends BlocProvider<SearchCustomerBloc> {
  static const String id = '/customer-search';

  SearchCustomerProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => SearchCustomerBloc(context),
          child: SearchCustomerView(),
        );
}

class SearchCustomerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SearchCustomerBloc, SearchCustomerState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
      ],
      child: SearchBarPage(),
    );
  }
}
