import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_bloc.dart';
import 'package:teclix/logic/bloc/customer_registration/customer_registration_state.dart';
import 'package:teclix/presentation/screens/customer/customer_registration/register_scaffold.dart';

void main() {
  group('Test page switcher functionality of customer registration flow', () {
    testWidgets(
        'when CUSTOMER_REG_START is given as the register process step.',
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
                pageSwitcher(CustomerRegProcessSteps.CUSTOMER_REG_START),
              ],
            )),
          ),
        )),
      ));
      expect(find.text('Add a New Customer'), findsOneWidget);
    });

    testWidgets(
        'when CUSTOMER_REG_STORE_DETAILS is given as the register process step.',
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
                pageSwitcher(
                    CustomerRegProcessSteps.CUSTOMER_REG_STORE_DETAILS),
              ],
            )),
          ),
        )),
      ));
      expect(find.text('Store Details'), findsOneWidget);
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Contact Number'), findsOneWidget);
    });

    testWidgets(
        'when CUSTOMER_REG_OWNER_DETAILS is given as the register process step.',
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
                pageSwitcher(
                    CustomerRegProcessSteps.CUSTOMER_REG_OWNER_DETAILS),
              ],
            )),
          ),
        )),
      ));
      expect(find.text('Owner Details'), findsOneWidget);
      expect(find.text('Owner\'s First Name'), findsOneWidget);
      expect(find.text('Owner\'s Last Name'), findsOneWidget);
    });

    testWidgets(
        'when CUSTOMER_REG_ADDRESS is given as the register process step.',
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
                pageSwitcher(CustomerRegProcessSteps.CUSTOMER_REG_ADDRESS),
              ],
            )),
          ),
        )),
      ));
      expect(find.text('Store Address'), findsOneWidget);
      expect(find.text('Street'), findsOneWidget);
      expect(find.text('City'), findsOneWidget);
      expect(find.text('District'), findsOneWidget);
      expect(find.text('Use my current location'), findsOneWidget);
    });

    testWidgets(
        'when CUSTOMER_REG_FINISH is given as the register process step.',
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
  });
}
