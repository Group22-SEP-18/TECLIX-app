import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/logic/bloc/signup/signup_bloc.dart';
import 'package:teclix/logic/bloc/signup/signup_state.dart';
import 'package:teclix/presentation/screens/signup/signup_scaffold.dart';

void main() {
  testWidgets('Can enter password', (WidgetTester tester) async {
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

    final pw = find.byKey(Key('pw_text'));

    await tester.enterText(pw, 'pw');

    expect(find.text('pw'), findsOneWidget);
  });
}
