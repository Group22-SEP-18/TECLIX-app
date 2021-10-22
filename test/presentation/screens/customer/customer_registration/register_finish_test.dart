import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_state.dart';
import 'package:teclix/presentation/screens/customer/customer_registration/register_scaffold.dart';

void main() {
  testWidgets('Customer registration process finish page rendering.',
      (WidgetTester tester) async {
    final width = 411.4;
    final height = 840.0;
    tester.binding.window.devicePixelRatioTestValue = (2.625);
    tester.binding.window.textScaleFactorTestValue = (1.1);
    final dpi = tester.binding.window.devicePixelRatio;
    tester.binding.window.physicalSizeTestValue =
        Size(width * dpi, height * dpi);
    await tester.pumpWidget(MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
          home: Scaffold(
        body: BlocProvider(
          create: (context) => CustomerRegistrationBloc(context),
          child: Container(
              child: Column(
            children: [
              pageSwitcher(CustomerRegProcessSteps.CUSTOMER_REG_FINISH),
            ],
          )),
        ),
      )),
    ));
    expect(find.text('Confirm Registration'), findsOneWidget);
    expect(find.text('Finish'), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });
}
