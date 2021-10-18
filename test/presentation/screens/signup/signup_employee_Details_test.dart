import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/logic/bloc/signup/signup_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_state.dart';
import 'package:teclix/presentation/screens/signup/signup_scaffold.dart';

void main() {
  testWidgets('Can enter email address', (WidgetTester tester) async {
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
    final emailText = find.byKey(Key('email_text'));
    await tester.enterText(emailText, 'test@gmail.com');
    expect(find.text('test@gmail.com'), findsOneWidget);
  });

  testWidgets('can enter employee number', (WidgetTester tester) async {
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
    final emailText = find.byKey(Key('emp_text'));
    await tester.enterText(emailText, 'emp1');
    expect(find.text('emp1'), findsOneWidget);
  });

  testWidgets('can enter contact number', (WidgetTester tester) async {
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
    final emailText = find.byKey(Key('contact_text'));
    await tester.enterText(emailText, '1234567');
    expect(find.text('1234567'), findsOneWidget);
  });
}
