import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:teclix/UI/common/TeclixColors.dart';
import 'package:teclix/UI/test.dart';

void main() {
  runApp(TeclixApp());
}

class TeclixApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(context, widget),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1000, name: TABLET),
            ResponsiveBreakpoint.resize(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
          background: Container(color: ColorPrimary)),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: PrimaryMaterialColor,
      ),
      home: TEst(),
    );
  }
}
