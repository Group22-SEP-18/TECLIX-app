import 'package:flutter/material.dart';

class RoundedOutlineButton extends StatelessWidget {
  RoundedOutlineButton({
    @required this.title,
    @required this.borderColor,
    @required this.fillColor,
    this.titleColor,
    this.fontSize = 18.0,
    this.buttonW,
    this.buttonH = 50.0,
    @required this.onPressed,
  });

  final Color fillColor;
  final Color borderColor;
  final String title;
  final Color titleColor;
  final Function onPressed;
  final double buttonW;
  final double buttonH;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 22.0),
      child: Material(
        color: fillColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
            side: BorderSide(color: borderColor)),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: buttonW,
          height: 50.0,
          child: Text(
            title,
            style: TextStyle(
              fontSize: this.fontSize,
              fontWeight: FontWeight.w600,
              color: titleColor,
            ),
          ),
        ),
      ),
    );
  }
}
