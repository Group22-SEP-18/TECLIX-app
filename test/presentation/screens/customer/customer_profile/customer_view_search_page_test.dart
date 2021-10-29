import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_bloc.dart';
import 'package:teclix/presentation/screens/customer/customer_profile/customer_view_search_page.dart';

void main() {
  testWidgets('Customer search page renders properly.',
      (WidgetTester tester) async {
    final width = 411.4;
    final height = 797.7;
    tester.binding.window.devicePixelRatioTestValue = (2.625);
    tester.binding.window.textScaleFactorTestValue = (1.1);
    final dpi = tester.binding.window.devicePixelRatio;
    tester.binding.window.physicalSizeTestValue =
        Size(width * dpi, height * dpi);
    await tester.pumpWidget(MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider(
          create: (context) => SearchCustomerBloc(context),
          child: CustomerViewSearchPage(),
        ),
      ),
    ));

    expect(find.text('Enter store name,customer name'), findsOneWidget);
  });

  testWidgets('Customer search page can take input',
      (WidgetTester tester) async {
    final width = 411.4;
    final height = 797.7;
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
            create: (context) => SearchCustomerBloc(context),
            child: CustomerViewSearchPage(),
          ),
        ),
      ),
    ));
    final field = find.byKey(Key('s-field'));
    await tester.enterText(field, 'ln');
    expect(find.text('ln'), findsOneWidget);
  });
}
