import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class TextBtn extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Function onClick;

  TextBtn({
    @required this.text,
    this.fontSize = 18.0,
    this.color = ColorPrimary,
    this.fontWeight = FontWeight.normal,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: ColorLightGreen,
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Text(
          text,
          style: TextStyle(
            fontSize: this.fontSize,
            fontWeight: this.fontWeight,
            color: this.color,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
