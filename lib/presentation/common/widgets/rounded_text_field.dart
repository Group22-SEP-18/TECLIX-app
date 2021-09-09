import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class RoundedTextField extends StatelessWidget {
  final Color fontColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color filColor;
  final Color enabledBorderColor;
  final String hint;
  final Function onPressed;
  final Function onTapped;
  final String fieldValue;
  final hideText;
  final Function validation;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isEnabled;

  RoundedTextField({
    this.hint,
    this.fontColor,
    this.focusedBorderColor = ColorPrimaryLight,
    this.enabledBorderColor = ColorLightGreen,
    this.errorBorderColor = ColorToastRed,
    this.filColor,
    this.onPressed,
    this.onTapped,
    this.controller,
    this.fieldValue,
    this.hideText = false,
    this.validation,
    this.keyboardType = TextInputType.text,
    this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return TextFormField(
      enabled: isEnabled,
      validator: validation,
      initialValue: fieldValue,
      onTap: onTapped,
      onChanged: onPressed,
      textAlign: TextAlign.center,
      controller: controller,
      obscureText: hideText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: fontColor ?? ColorHeadingFont.withOpacity(0.6),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 20.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: enabledBorderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: focusedBorderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              50.0,
            ),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorBorderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errorBorderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        errorStyle: TextStyle(height: 0, color: Colors.transparent),
        filled: true,
        fillColor: filColor ?? Colors.white,
      ),
      onEditingComplete: () => node.nextFocus(),
    );
  }
}
