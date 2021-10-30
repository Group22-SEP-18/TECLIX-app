import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teclix/data/models/customer_search.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_bloc.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_event.dart';
import 'package:teclix/logic/bloc/search_customer/search_customer_state.dart';
import 'package:teclix/presentation/screens/customer/customer_profile/customer_profile.dart';

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
    outstanding: '0.0',
    profilePicture:
        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png');
void main() {
  group('vehicle detail main page', () {
    MockSearchCustomerBloc mockSearchCustomerBloc;
    setUpAll(() {
      registerFallbackValue<SearchCustomerEvent>(SearchCustomerEventFake());
      registerFallbackValue<SearchCustomerState>(SearchCustomerStateFake());
      mockSearchCustomerBloc = MockSearchCustomerBloc();
      HttpOverrides.global = null;
      // mockInternetBloc = MockInternetBloc();
    });

    testWidgets('should load the customer profile screen when data is loaded',
        (WidgetTester tester) async {
      when(() => mockSearchCustomerBloc.state).thenReturn(
        SearchCustomerState(
            error: "",
            loading: false,
            selectedCus: customerSearch,
            searchResult: []),
      );

      final page = CustomerProfile();

      await tester.pumpWidget(BlocProvider<SearchCustomerBloc>(
        create: (context) => mockSearchCustomerBloc,
        child: MaterialApp(
          home: page,
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Customer Profile'), findsOneWidget);
    });

    testWidgets('should load the customer profile screen with correct data',
        (WidgetTester tester) async {
      when(() => mockSearchCustomerBloc.state).thenReturn(
        SearchCustomerState(
            error: "",
            loading: false,
            selectedCus: customerSearch,
            searchResult: []),
      );

      final page = CustomerProfile();

      await tester.pumpWidget(BlocProvider<SearchCustomerBloc>(
        create: (context) => mockSearchCustomerBloc,
        child: MaterialApp(
          home: page,
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('shop'), findsOneWidget);
      expect(find.text('test@gmail.com'), findsOneWidget);
    });
  });
}
