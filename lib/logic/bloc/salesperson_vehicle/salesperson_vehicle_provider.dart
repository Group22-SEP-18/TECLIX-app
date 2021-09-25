import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/presentation/screens/vehicle/vehicle_main.dart';

import 'salesperson_vehicle_bloc.dart';
import 'salesperson_vehicle_state.dart';

class SalespersonVehicleProvider extends BlocProvider<SalespersonVehicleBloc> {
  static const String id = '/vehicle-main';

  SalespersonVehicleProvider({
    Key key,
  }) : super(
          key: key,
          create: (context) => SalespersonVehicleBloc(context),
          child: SalespersonVehicleView(),
        );
}

class SalespersonVehicleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    return MultiBlocListener(
      listeners: [
        BlocListener<SalespersonVehicleBloc, SalespersonVehicleState>(
          listenWhen: (pre, current) => pre.error != current.error,
          listener: (context, state) {
            if (state.error?.isNotEmpty ?? false)
              print("ERROR: ${state.error}");
          },
        ),
      ],
      child: VehicleMain(),
    );
  }
}
