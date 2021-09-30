import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/presentation/screens/employee/sales_reports/sales_main_page.dart';

import 'sales_report_bloc.dart';
import 'sales_report_state.dart';

class SalesReportProvider extends BlocProvider<SalesReportBloc> {
  static const String id = '/sales-main';

  SalesReportProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => SalesReportBloc(context),
          child: SalesReportView(),
        );
}

class SalesReportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<SalesReportBloc, SalesReportState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
      ],
      child: SalesMainPage(),
    );
  }
}
