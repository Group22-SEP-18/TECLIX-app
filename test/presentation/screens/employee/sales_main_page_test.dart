import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/data/models/current_month_stat.dart';
import 'package:teclix/data/models/monthly_stat_comparison.dart';
import 'package:teclix/logic/bloc/sales_report/sales_report_bloc.dart';
import 'package:teclix/logic/bloc/sales_report/sales_report_event.dart';
import 'package:teclix/logic/bloc/sales_report/sales_report_state.dart';
import 'package:mocktail/mocktail.dart';
import 'package:teclix/presentation/screens/employee/sales_reports/sales_main_page.dart';
import 'package:teclix/presentation/screens/employee/sales_reports/widgets/line_chart.dart';
import 'package:teclix/presentation/screens/employee/sales_reports/widgets/sales_stat_card.dart';

class MockSalesReportBloc extends MockBloc<SalesReportEvent, SalesReportState>
    implements SalesReportBloc {}

class SalesReportEventFake extends Fake implements SalesReportEvent {}

class SalesReportStateFake extends Fake implements SalesReportState {}

void main() {
  group('User sales report screen renders propely.', () {
    MockSalesReportBloc mockSalesReportBloc;
    setUpAll(() {
      registerFallbackValue<SalesReportEvent>(SalesReportEventFake());
      registerFallbackValue<SalesReportState>(SalesReportStateFake());
      mockSalesReportBloc = MockSalesReportBloc();
    });
    testWidgets('should render the profile ui properly',
        (WidgetTester tester) async {
      when(() => mockSalesReportBloc.state).thenReturn(
        SalesReportState(
          error: '',
          loadingData: false,
          fetchFailed: false,
          currentMonthStat: CurrentMonthStat(),
          monthlyStatList: {},
          monthlyStatComparison: MonthlyStatComparison(),
        ),
      );

      final page = SalesMainPage();

      final width = 488.0;
      final height = 750;
      tester.binding.window.devicePixelRatioTestValue = (2.625);
      tester.binding.window.textScaleFactorTestValue = (0.8);
      final dpi = tester.binding.window.devicePixelRatio;
      tester.binding.window.physicalSizeTestValue =
          Size(width * dpi, height * dpi);

      await tester.pumpWidget(BlocProvider<SalesReportBloc>(
        create: (context) => mockSalesReportBloc,
        child: MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
            home: Scaffold(body: page),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Sales'), findsOneWidget);
      expect(find.text('Back'), findsOneWidget);
    });

    testWidgets('should render the loading  screen while data is laoding',
        (WidgetTester tester) async {
      when(() => mockSalesReportBloc.state).thenReturn(
        SalesReportState(
          error: '',
          loadingData: true,
          fetchFailed: false,
          currentMonthStat: CurrentMonthStat(),
          monthlyStatList: {},
          monthlyStatComparison: MonthlyStatComparison(),
        ),
      );

      final page = SalesMainPage();

      final width = 488.0;
      final height = 750;
      tester.binding.window.devicePixelRatioTestValue = (2.625);
      tester.binding.window.textScaleFactorTestValue = (0.8);
      final dpi = tester.binding.window.devicePixelRatio;
      tester.binding.window.physicalSizeTestValue =
          Size(width * dpi, height * dpi);

      await tester.pumpWidget(BlocProvider<SalesReportBloc>(
        create: (context) => mockSalesReportBloc,
        child: MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
            home: Scaffold(body: page),
          ),
        ),
      ));
      expect(find.text('Total Sales'), findsNothing);
      expect(find.text('Total Late payments'), findsNothing);
    });

    testWidgets('should render the monthly stats card properly',
        (WidgetTester tester) async {
      when(() => mockSalesReportBloc.state).thenReturn(
        SalesReportState(
          error: '',
          loadingData: false,
          fetchFailed: false,
          currentMonthStat: CurrentMonthStat(
              salesperson: 1, totalLatePay: 120.0, totalSales: 220.0),
          monthlyStatList: {},
          monthlyStatComparison: MonthlyStatComparison(),
        ),
      );

      final page = SalesMainPage();

      final width = 488.0;
      final height = 750;
      tester.binding.window.devicePixelRatioTestValue = (2.625);
      tester.binding.window.textScaleFactorTestValue = (0.8);
      final dpi = tester.binding.window.devicePixelRatio;
      tester.binding.window.physicalSizeTestValue =
          Size(width * dpi, height * dpi);

      await tester.pumpWidget(BlocProvider<SalesReportBloc>(
        create: (context) => mockSalesReportBloc,
        child: MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
            home: Scaffold(body: page),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.byType(SalesStatCard), findsNWidgets(2));
      expect(find.text('Total Sales'), findsOneWidget);
      expect(find.text('Total Late payments'), findsOneWidget);
      expect(find.text('Rs 120.00'), findsOneWidget);
      expect(find.text('Rs 220.00'), findsOneWidget);
    });

    testWidgets('should render the line graph  properly',
        (WidgetTester tester) async {
      when(() => mockSalesReportBloc.state).thenReturn(
        SalesReportState(
          error: '',
          loadingData: false,
          fetchFailed: false,
          currentMonthStat: CurrentMonthStat(),
          monthlyStatList: {0: 120, 1: 120, 2: 120},
          monthlyStatComparison: MonthlyStatComparison(),
        ),
      );

      final page = SalesMainPage();

      final width = 488.0;
      final height = 750;
      tester.binding.window.devicePixelRatioTestValue = (2.625);
      tester.binding.window.textScaleFactorTestValue = (0.8);
      final dpi = tester.binding.window.devicePixelRatio;
      tester.binding.window.physicalSizeTestValue =
          Size(width * dpi, height * dpi);

      await tester.pumpWidget(BlocProvider<SalesReportBloc>(
        create: (context) => mockSalesReportBloc,
        child: MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
            home: Scaffold(body: page),
          ),
        ),
      ));
      await tester.pumpAndSettle();
      expect(find.byType(SalesLineChart), findsOneWidget);
      expect(find.text('Monthly Total Sales'), findsOneWidget);
      expect(find.text('Monthly Stats ( November )'), findsOneWidget);
    });
  });
}
