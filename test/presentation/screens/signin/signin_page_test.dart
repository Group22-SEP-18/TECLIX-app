import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/logic/bloc/root/root_bloc.dart';
import 'package:teclix/presentation/screens/signin/signin_page.dart';

void main() {
  testWidgets('Signin page renders properly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: BlocProvider(
          create: (context) => RootBloc(context), child: SignInPage()),
    )));

    final email = find.byKey(Key('email'));
    final password = find.byKey(Key('pw'));

    expect(email, findsOneWidget);
    expect(password, findsOneWidget);
    expect(find.text('Login to my account'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);
  });
  testWidgets('Can enter email and password for signing in.',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: Scaffold(
      body: BlocProvider(
          create: (context) => RootBloc(context), child: SignInPage()),
    )));

    final email = find.byKey(Key('email'));
    final password = find.byKey(Key('pw'));

    await tester.enterText(email, 'email@gamail.com');
    await tester.enterText(password, '12345');

    expect(find.text('email@gamail.com'), findsOneWidget);
    expect(find.text('12345'), findsOneWidget);
  });
}
