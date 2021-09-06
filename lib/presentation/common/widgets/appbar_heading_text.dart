import 'package:flutter/material.dart';

class AppbarHeadingText extends StatelessWidget {
  final String title;
  final double fontSize;

  const AppbarHeadingText({this.title, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize ?? 25.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
