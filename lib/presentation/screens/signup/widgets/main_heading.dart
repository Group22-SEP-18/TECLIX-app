import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class MainHeading extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  MainHeading(
      {@required this.text,
      this.fontSize = 22.0,
      this.color = ColorHeadingFont,
      this.fontWeight = FontWeight.w600});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: this.fontSize,
          fontWeight: this.fontWeight,
          color: this.color,
        ),
      ),
    );
  }
}
