import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class SubHeading extends StatelessWidget {
  final String title;

  const SubHeading({this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          color: ColorHeadingFont,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
