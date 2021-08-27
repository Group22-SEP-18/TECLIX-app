import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({
    @required this.title,
    this.colour,
    this.titleColor,
    @required this.onPressed,
    this.fontSize = 18.0,
    this.buttonW,
    this.buttonH = 50.0,
    this.iconWidget,
    this.padding = 22.0,
  });

  final Color colour;
  final String title;
  final Color titleColor;
  final Function onPressed;
  final double buttonW;
  final double buttonH;
  final double fontSize;
  final Widget iconWidget;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: padding,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: buttonH,
          width: buttonW,
          decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.all(
              Radius.circular(50.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              iconWidget == null ? Container() : iconWidget,
              Text(
                title,
                style: TextStyle(
                  fontSize: this.fontSize,
                  fontWeight: FontWeight.w600,
                  color: titleColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
