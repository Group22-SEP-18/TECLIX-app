import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/logic/bloc/internet/internet_bloc.dart';
import 'package:teclix/logic/bloc/salesperson_vehicle/salesperson_vehicle_bloc.dart';
import 'package:teclix/presentation/screens/vehicle/vehicle_main.dart';

void main() {
  group('Vehicle information screen', () {
    testWidgets('test the ui components before data is loaded.',
        (WidgetTester tester) async {
      Connectivity connectivity = Connectivity();

      await tester.pumpWidget(MaterialApp(
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SalespersonVehicleBloc(context),
            ),
            BlocProvider(
              create: (context) => InternetBloc(context, connectivity),
            )
          ],
          child: VehicleMain(),
        ),
      ));
      expect(find.byKey(Key('vehicle-heading')), findsOneWidget);
      expect(find.text('Assigned Vehicle'), findsOneWidget);
      expect(find.text('Remaining Stock Status'), findsOneWidget);
    });
  });
}
