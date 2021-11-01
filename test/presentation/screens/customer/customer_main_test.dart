import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teclix/data/models/daily_stats.dart';
import 'package:teclix/data/models/salesperson.dart';
import 'package:teclix/logic/bloc/customer_main/customer_main_bloc.dart';
import 'package:teclix/logic/bloc/customer_main/customer_main_event.dart';
import 'package:teclix/logic/bloc/customer_main/customer_main_state.dart';
import 'package:teclix/logic/bloc/internet/internet_bloc.dart';
import 'package:teclix/logic/bloc/internet/internet_event.dart';
import 'package:teclix/logic/bloc/internet/internet_state.dart';
import 'package:teclix/logic/bloc/root/root_bloc.dart';
import 'package:teclix/logic/bloc/root/root_event.dart';
import 'package:teclix/logic/bloc/root/root_state.dart';
import 'package:teclix/presentation/screens/customer/customer_main.dart';
import 'package:teclix/presentation/screens/customer/widgets/option_card.dart';

class MockCustomerMainBloc
    extends MockBloc<CustomerMainEvent, CustomerMainState>
    implements CustomerMainBloc {}

class CustomerMainEventFake extends Fake implements CustomerMainEvent {}

class CustomerMainStateFake extends Fake implements CustomerMainState {}

class MockInternetBloc extends MockBloc<InternetEvent, InternetState>
    implements InternetBloc {}

class InternetEventFake extends Fake implements InternetEvent {}

class InternetStateFake extends Fake implements InternetState {}

class MockRootBloc extends MockBloc<RootEvent, RootState> implements RootBloc {}

class RootEventFake extends Fake implements RootEvent {}

class RootStateFake extends Fake implements RootState {}

final sp = Salesperson(
    firstName: 'sp_fn',
    lastName: 'sp_ln',
    contactNo: '12',
    email: 't@gmail.com',
    employeeNo: 'emp',
    profilePictureUrl:
        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png');

void main() {
  group('Customer Dashboard main page', () {
    MockCustomerMainBloc mockCustomerMainBloc;
    MockInternetBloc mockInternetBloc;
    MockRootBloc mockRootBloc;

    setUpAll(() {
      registerFallbackValue<CustomerMainEvent>(CustomerMainEventFake());
      registerFallbackValue<InternetEvent>(InternetEventFake());
      registerFallbackValue<CustomerMainState>(CustomerMainStateFake());
      registerFallbackValue<InternetState>(InternetStateFake());
      mockCustomerMainBloc = MockCustomerMainBloc();
      mockInternetBloc = MockInternetBloc();
      registerFallbackValue<RootEvent>(RootEventFake());
      registerFallbackValue<RootState>(RootStateFake());
      mockRootBloc = MockRootBloc();
      HttpOverrides.global = null;
    });

    testWidgets('should load the leaderboard  screen when data is loaded',
        (WidgetTester tester) async {
      when(() => mockRootBloc.state).thenReturn(
        RootState(
          error: '',
          userLoginState: UserLoginState.CHECKING,
          loggedUser: sp,
          loading: false,
          loginFailed: false,
          logoutFailed: false,
          loginError: null,
        ),
      );

      when(() => mockCustomerMainBloc.state).thenReturn(
        CustomerMainState(
          error: '',
          loadingData: false,
          dailyStats: DailyStats(),
        ),
      );

      when(() => mockInternetBloc.state).thenReturn(
        InternetState(
            error: "",
            initialChecking: false,
            status: InternetConnection.CONNECTED),
      );

      final page = CustomerMain();

      await tester.pumpWidget(BlocProvider<RootBloc>(
        create: (context) => mockRootBloc,
        child: BlocProvider<InternetBloc>(
          create: (context) => mockInternetBloc,
          child: BlocProvider<CustomerMainBloc>(
            create: (context) => mockCustomerMainBloc,
            child: MaterialApp(
              home: page,
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Dashboard'), findsOneWidget);
      expect(find.text('Welcome Back, sp_fn sp_ln'), findsOneWidget);
    });

    testWidgets('should consist of 4 option cards',
        (WidgetTester tester) async {
      when(() => mockRootBloc.state).thenReturn(
        RootState(
          error: '',
          userLoginState: UserLoginState.CHECKING,
          loggedUser: sp,
          loading: false,
          loginFailed: false,
          logoutFailed: false,
          loginError: null,
        ),
      );

      when(() => mockCustomerMainBloc.state).thenReturn(
        CustomerMainState(
          error: '',
          loadingData: false,
          dailyStats: DailyStats(),
        ),
      );

      when(() => mockInternetBloc.state).thenReturn(
        InternetState(
            error: "",
            initialChecking: false,
            status: InternetConnection.CONNECTED),
      );

      final page = CustomerMain();

      await tester.pumpWidget(BlocProvider<RootBloc>(
        create: (context) => mockRootBloc,
        child: BlocProvider<InternetBloc>(
          create: (context) => mockInternetBloc,
          child: BlocProvider<CustomerMainBloc>(
            create: (context) => mockCustomerMainBloc,
            child: MaterialApp(
              home: page,
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.byType(ProfileOptionCard), findsNWidgets(4));
      expect(find.text('Create Account'), findsOneWidget);
      expect(find.text('View Account'), findsOneWidget);
      expect(find.text('Create SO'), findsOneWidget);
      expect(find.text('Late Payment'), findsOneWidget);
    });

    testWidgets('should consist of 4 option cards',
        (WidgetTester tester) async {
      when(() => mockRootBloc.state).thenReturn(
        RootState(
          error: '',
          userLoginState: UserLoginState.CHECKING,
          loggedUser: sp,
          loading: false,
          loginFailed: false,
          logoutFailed: false,
          loginError: null,
        ),
      );

      when(() => mockCustomerMainBloc.state).thenReturn(
        CustomerMainState(
          error: '',
          loadingData: false,
          dailyStats: DailyStats(shops: 0, payCount: 0, totalSales: 0.00),
        ),
      );

      when(() => mockInternetBloc.state).thenReturn(
        InternetState(
            error: "",
            initialChecking: false,
            status: InternetConnection.CONNECTED),
      );

      final page = CustomerMain();

      await tester.pumpWidget(BlocProvider<RootBloc>(
        create: (context) => mockRootBloc,
        child: BlocProvider<InternetBloc>(
          create: (context) => mockInternetBloc,
          child: BlocProvider<CustomerMainBloc>(
            create: (context) => mockCustomerMainBloc,
            child: MaterialApp(
              home: page,
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Today\'s Stats'), findsOneWidget);
      expect(find.text('Stores Visited:'), findsOneWidget);
      expect(find.text('Payments Collected:'), findsOneWidget);
      expect(find.text('Total Sales:'), findsOneWidget);
      expect(find.text('00'), findsNWidgets(2));
      expect(find.text('Rs 0.00'), findsOneWidget);
    });
  });
}
