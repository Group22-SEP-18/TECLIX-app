import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:teclix/presentation/screens/signin/welcome_page.dart';

void main() {
  testWidgets('Welcome page renders properly.', (WidgetTester tester) async {
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
        home: WelcomePage(),
      ),
    ));

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });
}
