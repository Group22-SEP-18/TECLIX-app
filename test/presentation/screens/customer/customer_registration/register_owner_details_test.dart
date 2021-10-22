import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_state.dart';
import 'package:teclix/presentation/screens/customer/customer_registration/register_scaffold.dart';

void main() {
  testWidgets('customer registration can enter store owner details.',
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
              pageSwitcher(CustomerRegProcessSteps.CUSTOMER_REG_OWNER_DETAILS),
            ],
          )),
        ),
      )),
    ));
    final field1 = find.byKey(Key('fn'));
    final field2 = find.byKey(Key('ln'));

    await tester.enterText(field1, 'fname');
    await tester.enterText(field2, 'lname');

    expect(find.text('fname'), findsOneWidget);
    expect(find.text('lname'), findsOneWidget);
  });
}
