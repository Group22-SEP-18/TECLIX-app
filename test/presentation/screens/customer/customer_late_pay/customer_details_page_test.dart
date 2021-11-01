import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teclix/data/models/customer_search.dart';
import 'package:teclix/logic/bloc/customer_late_pay/customer_late_pay_bloc.dart';
import 'package:teclix/logic/bloc/customer_late_pay/customer_late_pay_event.dart';
import 'package:teclix/logic/bloc/customer_late_pay/customer_late_pay_state.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_bloc.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_event.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_state.dart';
import 'package:teclix/presentation/screens/customer/customer_late_payment/customer_details_page.dart';

class MockCustomerLatePayBloc
    extends MockBloc<CustomerLatePayEvent, CustomerLatePayState>
    implements CustomerLatePayBloc {}

class CustomerLatePayEventFake extends Fake implements CustomerLatePayEvent {}

class CustomerLatePayStateFake extends Fake implements CustomerLatePayState {}

class MockSearchCustomerBloc
    extends MockBloc<SearchCustomerEvent, SearchCustomerState>
    implements SearchCustomerBloc {}

class SearchCustomerEventFake extends Fake implements SearchCustomerEvent {}

class SearchCustomerStateFake extends Fake implements SearchCustomerState {}

final customerSearch = CustomerSearch(
    id: 1,
    loyaltyPoints: '0.0',
    city: 'c',
    street: 's',
    district: 'd',
    ownerLastName: 'ol',
    ownerFirstName: 'of',
    shopName: 'shop',
    email: 'test@gmail.com',
    longitude: '1.0',
    latitude: '1.1',
    contactNo: '123',
    outstanding: '250.0',
    profilePicture:
        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png');

void main() {
  group('Late pay customer details page is rendered properly.', () {
    MockCustomerLatePayBloc mockCustomerLatePayBloc;
    MockSearchCustomerBloc mockSearchCustomerBloc;
    setUpAll(() {
      registerFallbackValue<CustomerLatePayEvent>(CustomerLatePayEventFake());
      registerFallbackValue<CustomerLatePayState>(CustomerLatePayStateFake());
      registerFallbackValue<SearchCustomerEvent>(SearchCustomerEventFake());
      registerFallbackValue<SearchCustomerState>(SearchCustomerStateFake());
      mockCustomerLatePayBloc = MockCustomerLatePayBloc();
      mockSearchCustomerBloc = MockSearchCustomerBloc();
      HttpOverrides.global = null;
    });
    testWidgets('should render the main ui properly',
        (WidgetTester tester) async {
      when(() => mockCustomerLatePayBloc.state).thenReturn(
        CustomerLatePayState(
          error: '',
          amount: '250.0',
          checkBoxValue: true,
          loading: false,
          paymentFailed: false,
          customerId: null,
          paymentDone: false,
        ),
      );
      when(() => mockSearchCustomerBloc.state).thenReturn(
        SearchCustomerState(
            error: "",
            loading: false,
            selectedCus: customerSearch,
            searchResult: []),
      );

      final page = CustomerDetails();

      final width = 488.0;
      final height = 750;
      tester.binding.window.devicePixelRatioTestValue = (2.625);
      tester.binding.window.textScaleFactorTestValue = (0.8);
      final dpi = tester.binding.window.devicePixelRatio;
      tester.binding.window.physicalSizeTestValue =
          Size(width * dpi, height * dpi);

      await tester.pumpWidget(BlocProvider<SearchCustomerBloc>(
        create: (context) => mockSearchCustomerBloc,
        child: BlocProvider<CustomerLatePayBloc>(
          create: (context) => mockCustomerLatePayBloc,
          child: MediaQuery(
            data: MediaQueryData(),
            child: MaterialApp(
              home: Scaffold(body: page),
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Customer Details'), findsOneWidget);
      expect(find.text('Back'), findsOneWidget);
    });

    testWidgets('should render the customer information in the  ui properly',
        (WidgetTester tester) async {
      when(() => mockCustomerLatePayBloc.state).thenReturn(
        CustomerLatePayState(
          error: '',
          amount: '250.0',
          checkBoxValue: true,
          loading: false,
          paymentFailed: false,
          customerId: null,
          paymentDone: false,
        ),
      );
      when(() => mockSearchCustomerBloc.state).thenReturn(
        SearchCustomerState(
            error: "",
            loading: false,
            selectedCus: customerSearch,
            searchResult: []),
      );

      final page = CustomerDetails();

      final width = 488.0;
      final height = 750;
      tester.binding.window.devicePixelRatioTestValue = (2.625);
      tester.binding.window.textScaleFactorTestValue = (0.8);
      final dpi = tester.binding.window.devicePixelRatio;
      tester.binding.window.physicalSizeTestValue =
          Size(width * dpi, height * dpi);

      await tester.pumpWidget(BlocProvider<SearchCustomerBloc>(
        create: (context) => mockSearchCustomerBloc,
        child: BlocProvider<CustomerLatePayBloc>(
          create: (context) => mockCustomerLatePayBloc,
          child: MediaQuery(
            data: MediaQueryData(),
            child: MaterialApp(
              home: Scaffold(body: page),
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('shop'), findsOneWidget);
      expect(find.text('of ol'), findsOneWidget);
    });

    testWidgets('should render the current outstanding properly',
        (WidgetTester tester) async {
      when(() => mockCustomerLatePayBloc.state).thenReturn(
        CustomerLatePayState(
          error: '',
          amount: '250.0',
          checkBoxValue: true,
          loading: false,
          paymentFailed: false,
          customerId: null,
          paymentDone: false,
        ),
      );
      when(() => mockSearchCustomerBloc.state).thenReturn(
        SearchCustomerState(
            error: "",
            loading: false,
            selectedCus: customerSearch,
            searchResult: []),
      );

      final page = CustomerDetails();

      final width = 488.0;
      final height = 750;
      tester.binding.window.devicePixelRatioTestValue = (2.625);
      tester.binding.window.textScaleFactorTestValue = (0.8);
      final dpi = tester.binding.window.devicePixelRatio;
      tester.binding.window.physicalSizeTestValue =
          Size(width * dpi, height * dpi);

      await tester.pumpWidget(BlocProvider<SearchCustomerBloc>(
        create: (context) => mockSearchCustomerBloc,
        child: BlocProvider<CustomerLatePayBloc>(
          create: (context) => mockCustomerLatePayBloc,
          child: MediaQuery(
            data: MediaQueryData(),
            child: MaterialApp(
              home: Scaffold(body: page),
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Current Outstanding'), findsOneWidget);
      expect(find.text('Rs 250.00'), findsOneWidget);
    });
  });
}
