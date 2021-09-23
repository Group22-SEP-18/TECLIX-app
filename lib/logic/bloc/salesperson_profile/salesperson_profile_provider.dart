import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/presentation/screens/employee/employee_profile/employee_profile_page.dart';

import 'salesperson_profile_bloc.dart';
import 'salesperson_profile_state.dart';

class SalespersonProfileProvider extends BlocProvider<SalespersonProfileBloc> {
  static const String id = '/salesperson-profile';
  SalespersonProfileProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => SalespersonProfileBloc(context),
          child: SalespersonProfileView(),
        );
}

class SalespersonProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    return MultiBlocListener(
      listeners: [
        BlocListener<SalespersonProfileBloc, SalespersonProfileState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
      ],
      child: EmployeeProfilePage(),
    );
  }
}
