import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class CancelText extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  CancelText({
    @required this.text,
    this.fontSize = 18.0,
    this.color = ColorPrimary,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
        color: this.color,
      ),
      textAlign: TextAlign.center,
    );
  }
}
