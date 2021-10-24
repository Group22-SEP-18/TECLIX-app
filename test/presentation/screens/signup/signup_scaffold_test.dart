import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/logic/bloc/signup/signup_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_state.dart';
import 'package:teclix/presentation/screens/signup/signup_scaffold.dart';

void main() {
  group('Test page switcher functionality of the signup flow', () {
    testWidgets('when SIGNUP_START is given as the signup process',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: BlocProvider(
        create: (context) => SignupBloc(context),
        child: Container(
            child: Column(
          children: [
            pageSwitcher(SignupProcessSteps.SIGNUP_START),
          ],
        )),
      )));
      expect(find.text('Create Account'), findsOneWidget);
    });

    testWidgets('when SIGNUP_EMP_DETAILS is given as the signup process',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
        body: BlocProvider(
          create: (context) => SignupBloc(context),
          child: Container(
              child: Column(
            children: [
              pageSwitcher(SignupProcessSteps.SIGNUP_EMP_DETAILS),
            ],
          )),
        ),
      )));
      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Employee Number'), findsOneWidget);
      expect(find.text('Contact Number'), findsOneWidget);
    });

    testWidgets('when SIGNUP_BASIC_DETAILS is given as the signup process',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
        body: BlocProvider(
          create: (context) => SignupBloc(context),
          child: Container(
              child: Column(
            children: [
              pageSwitcher(SignupProcessSteps.SIGNUP_BASIC_DETAILS),
            ],
          )),
        ),
      )));
      expect(find.text('First Name'), findsOneWidget);
      expect(find.text('Last Name'), findsOneWidget);
    });

    testWidgets('when SIGNUP_PASSWORD is given as the signup process',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
        body: BlocProvider(
          create: (context) => SignupBloc(context),
          child: Container(
              child: Column(
            children: [
              pageSwitcher(SignupProcessSteps.SIGNUP_PASSWORD),
            ],
          )),
        ),
      )));
      expect(find.text('Password'), findsWidgets);
    });
    testWidgets('when SIGNUP_PROFILE_PICTURE is given as the signup process',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
        body: BlocProvider(
          create: (context) => SignupBloc(context),
          child: Container(
              child: Column(
            children: [
              pageSwitcher(SignupProcessSteps.SIGNUP_PROFILE_PICTURE),
            ],
          )),
        ),
      )));
      expect(find.text('Gallery'), findsOneWidget);
      expect(find.text('Camera'), findsOneWidget);
    });

    testWidgets('when SIGNUP_FINISH is given as the signup process',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
          home: Scaffold(
        body: BlocProvider(
          create: (context) => SignupBloc(context),
          child: Container(
              child: Column(
            children: [
              pageSwitcher(SignupProcessSteps.SIGNUP_FINISH),
            ],
          )),
        ),
      )));
      expect(find.text('Confirm Registration'), findsOneWidget);
      expect(find.text('Finish'), findsOneWidget);
    });
  });
}
