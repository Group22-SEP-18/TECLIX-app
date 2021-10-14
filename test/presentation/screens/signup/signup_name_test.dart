import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/logic/bloc/signup/signup_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_state.dart';
import 'package:teclix/presentation/screens/signup/signup_scaffold.dart';

void main() {
  testWidgets('Can enter basic details', (WidgetTester tester) async {
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

    final firstName = find.byKey(Key('fn_text'));
    final lastName = find.byKey(Key('ln_text'));

    await tester.enterText(firstName, 'fn');
    await tester.enterText(lastName, 'ln');

    expect(find.text('fn'), findsOneWidget);
    expect(find.text('ln'), findsOneWidget);
  });
}
