import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teclix/data/models/leaderboard.dart';
import 'package:teclix/data/models/leaderboard_salesperson.dart';
import 'package:teclix/data/models/salesperson.dart';
import 'package:teclix/logic/bloc/internet/internet_bloc.dart';
import 'package:teclix/logic/bloc/internet/internet_event.dart';
import 'package:teclix/logic/bloc/internet/internet_state.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_bloc.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_event.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_state.dart';
import 'package:teclix/logic/bloc/root/root_bloc.dart';
import 'package:teclix/logic/bloc/root/root_event.dart';
import 'package:teclix/logic/bloc/root/root_state.dart';
import 'package:teclix/presentation/screens/employee/employee_profile/employee_profile_page.dart';
import 'package:teclix/presentation/screens/employee/employee_profile/widgets/expandable_card.dart';
import 'package:intl/intl.dart';

class MockLeaderboardBloc extends MockBloc<LeaderboardEvent, LeaderboardState>
    implements LeaderboardBloc {}

class LeaderboardEventFake extends Fake implements LeaderboardEvent {}

class LeaderboardStateFake extends Fake implements LeaderboardState {}

class MockRootBloc extends MockBloc<RootEvent, RootState> implements RootBloc {}

class RootEventFake extends Fake implements RootEvent {}

class RootStateFake extends Fake implements RootState {}

class MockInternetBloc extends MockBloc<InternetEvent, InternetState>
    implements InternetBloc {}

class InternetEventFake extends Fake implements InternetEvent {}

class InternetStateFake extends Fake implements InternetState {}

final lb = [
  Leaderboard(
    pointsCurrentMonth: '100',
    pointsAllTime: '100',
    pointsToday: '100',
    salesperson: LeaderboardSalesperson(
        firstName: 'fn',
        lastName: 'ln',
        profilePicture:
            'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png'),
  ),
  Leaderboard(
    pointsCurrentMonth: '200',
    pointsAllTime: '100',
    pointsToday: '100',
    salesperson: LeaderboardSalesperson(
        firstName: 'fn2',
        lastName: 'ln2',
        profilePicture:
            'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png'),
  ),
  Leaderboard(
    pointsCurrentMonth: '300',
    pointsAllTime: '100',
    pointsToday: '100',
    salesperson: LeaderboardSalesperson(
        firstName: 'fn2',
        lastName: 'ln2',
        profilePicture:
            'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png'),
  )
];

final sp = Salesperson(
    firstName: 'sp_fn',
    lastName: 'sp_ln',
    contactNo: '12',
    email: 't@gmail.com',
    employeeNo: 'emp',
    profilePictureUrl:
        'https://upload.wikimedia.org/wikipedia/commons/b/b6/Image_created_with_a_mobile_phone.png');

void main() {
  group('vehicle detail main page', () {
    MockLeaderboardBloc mockLeaderboardBloc;
    MockInternetBloc mockInternetBloc;
    MockRootBloc mockRootBloc;
    setUpAll(() {
      registerFallbackValue<LeaderboardEvent>(LeaderboardEventFake());
      registerFallbackValue<InternetEvent>(InternetEventFake());
      registerFallbackValue<LeaderboardState>(LeaderboardStateFake());
      registerFallbackValue<InternetState>(InternetStateFake());
      registerFallbackValue<RootEvent>(RootEventFake());
      registerFallbackValue<RootState>(RootStateFake());
      mockRootBloc = MockRootBloc();
      mockLeaderboardBloc = MockLeaderboardBloc();
      mockInternetBloc = MockInternetBloc();
      HttpOverrides.global = null;
    });

    testWidgets('should render the profile ui properly',
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
      when(() => mockLeaderboardBloc.state).thenReturn(
        LeaderboardState(
            error: "", loadingData: false, loggedUser: 1, leaderboard: lb),
      );
      when(() => mockInternetBloc.state).thenReturn(
        InternetState(
            error: "",
            initialChecking: false,
            status: InternetConnection.CONNECTED),
      );

      final page = EmployeeProfilePage();

      await tester.pumpWidget(BlocProvider<RootBloc>(
        create: (context) => mockRootBloc,
        child: BlocProvider<InternetBloc>(
          create: (context) => mockInternetBloc,
          child: BlocProvider<LeaderboardBloc>(
            create: (context) => mockLeaderboardBloc,
            child: MaterialApp(
              home: page,
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Profile'), findsOneWidget);
      expect(find.text('Logout'), findsOneWidget);
    });

    testWidgets('should render four expandable cards with  data  properly',
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
      when(() => mockLeaderboardBloc.state).thenReturn(
        LeaderboardState(
            error: "", loadingData: false, loggedUser: 1, leaderboard: lb),
      );
      when(() => mockInternetBloc.state).thenReturn(
        InternetState(
            error: "",
            initialChecking: false,
            status: InternetConnection.CONNECTED),
      );

      final page = EmployeeProfilePage();

      await tester.pumpWidget(BlocProvider<RootBloc>(
        create: (context) => mockRootBloc,
        child: BlocProvider<InternetBloc>(
          create: (context) => mockInternetBloc,
          child: BlocProvider<LeaderboardBloc>(
            create: (context) => mockLeaderboardBloc,
            child: MaterialApp(
              home: page,
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.byType(ExpandableCard), findsNWidgets(4));
    });
    testWidgets('should render salesperson data  properly',
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
      when(() => mockLeaderboardBloc.state).thenReturn(
        LeaderboardState(
            error: "", loadingData: false, loggedUser: 1, leaderboard: lb),
      );
      when(() => mockInternetBloc.state).thenReturn(
        InternetState(
            error: "",
            initialChecking: false,
            status: InternetConnection.CONNECTED),
      );

      final page = EmployeeProfilePage();

      await tester.pumpWidget(BlocProvider<RootBloc>(
        create: (context) => mockRootBloc,
        child: BlocProvider<InternetBloc>(
          create: (context) => mockInternetBloc,
          child: BlocProvider<LeaderboardBloc>(
            create: (context) => mockLeaderboardBloc,
            child: MaterialApp(
              home: page,
            ),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(
          find.text(toBeginningOfSentenceCase(sp.firstName) +
              ' ' +
              toBeginningOfSentenceCase(sp.lastName)),
          findsNWidgets(2));
    });
  });
}
