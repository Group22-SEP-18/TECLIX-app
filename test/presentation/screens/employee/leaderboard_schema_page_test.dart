import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/presentation/screens/employee/leaderboard_Schema/leaderboard_schema_page.dart';
import 'package:teclix/presentation/screens/employee/leaderboard_Schema/schema_card.dart';

void main() {
  group('Leaderboard point schema page rendering', () {
    testWidgets('page basic ui renders properly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LeaderboardSchemaPage(),
      ));
      expect(find.text('Leaderboard Schema'), findsOneWidget);
      expect(find.text('Back'), findsOneWidget);
    });
    testWidgets('sceham cards are rendered properly',
        (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: LeaderboardSchemaPage(),
      ));
      expect(find.byType(SchemaCard), findsNWidgets(3));
      expect(find.text('Customer Registration'), findsOneWidget);
      expect(find.text('Service Order Creation'), findsOneWidget);
      expect(find.text('Late Payment Collection'), findsOneWidget);
    });
  });
}
