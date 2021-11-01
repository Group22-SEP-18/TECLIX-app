import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/data/models/leaderboard.dart';
import 'package:teclix/data/models/leaderboard_salesperson.dart';
import 'package:teclix/logic/bloc/internet/internet_bloc.dart';
import 'package:teclix/logic/bloc/internet/internet_event.dart';
import 'package:teclix/logic/bloc/internet/internet_state.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_bloc.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_event.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teclix/presentation/screens/leaderboard/leaderboard.dart';
import 'package:teclix/presentation/screens/leaderboard/widgets/profile_picture_avatar.dart';

class MockLeaderboardBloc extends MockBloc<LeaderboardEvent, LeaderboardState>
    implements LeaderboardBloc {}

class LeaderboardEventFake extends Fake implements LeaderboardEvent {}

class LeaderboardStateFake extends Fake implements LeaderboardState {}

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

void main() {
  group('vehicle detail main page', () {
    MockLeaderboardBloc mockLeaderboardBloc;
    MockInternetBloc mockInternetBloc;
    setUpAll(() {
      registerFallbackValue<LeaderboardEvent>(LeaderboardEventFake());
      registerFallbackValue<InternetEvent>(InternetEventFake());
      registerFallbackValue<LeaderboardState>(LeaderboardStateFake());
      registerFallbackValue<InternetState>(InternetStateFake());
      mockLeaderboardBloc = MockLeaderboardBloc();
      mockInternetBloc = MockInternetBloc();
      HttpOverrides.global = null;
    });

    testWidgets('should load the leaderboard  screen when data is loaded',
        (WidgetTester tester) async {
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

      final page = LeaderboardPage();

      await tester.pumpWidget(BlocProvider<InternetBloc>(
        create: (context) => mockInternetBloc,
        child: BlocProvider<LeaderboardBloc>(
          create: (context) => mockLeaderboardBloc,
          child: MaterialApp(
            home: page,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Leaderboard'), findsOneWidget);
    });

    testWidgets('should show top three salespersons',
        (WidgetTester tester) async {
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

      final page = LeaderboardPage();

      await tester.pumpWidget(BlocProvider<InternetBloc>(
        create: (context) => mockInternetBloc,
        child: BlocProvider<LeaderboardBloc>(
          create: (context) => mockLeaderboardBloc,
          child: MaterialApp(
            home: page,
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.byType(ProfilePicAvatar), findsNWidgets(3));
    });
    testWidgets('should show loading screen when reload btn is pressed',
        (WidgetTester tester) async {
      when(() => mockLeaderboardBloc.state).thenReturn(
        LeaderboardState(
            error: "", loadingData: true, loggedUser: 1, leaderboard: lb),
      );
      when(() => mockInternetBloc.state).thenReturn(
        InternetState(
            error: "",
            initialChecking: false,
            status: InternetConnection.CONNECTED),
      );

      final page = LeaderboardPage();

      await tester.pumpWidget(BlocProvider<InternetBloc>(
        create: (context) => mockInternetBloc,
        child: BlocProvider<LeaderboardBloc>(
          create: (context) => mockLeaderboardBloc,
          child: MaterialApp(
            home: page,
          ),
        ),
      ));

      expect(find.text('Leaderboard'), findsNothing);
    });
  });
}
