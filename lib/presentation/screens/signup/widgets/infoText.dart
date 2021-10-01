import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class InfoText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign textAlign;
  final FontWeight fontWeight;
  final Color textColor;
  InfoText(
      {this.text,
      this.textAlign = TextAlign.justify,
      this.fontSize = 17.0,
      this.fontWeight,
      this.textColor = ColorPrimary});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: this.fontSize,
        fontWeight: this.fontWeight,
        color: this.textColor,
      ),
    );
  }
}
