import 'package:flutter/material.dart';

class HeaderBackButton extends StatelessWidget {
  final Function whenTapped;
  final double fontSize;

  const HeaderBackButton({Key key, @required this.whenTapped, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whenTapped,
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
          ),
          Text(
            'Back',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: fontSize ?? 18.0,
            ),
          ),
        ],
      ),
    );
  }
}
