import 'package:flutter/material.dart';

class ProfileAttrValueText extends StatelessWidget {
  final String attrValue;

  const ProfileAttrValueText({@required this.attrValue});

  @override
  Widget build(BuildContext context) {
    return Text(
      attrValue,
      style: TextStyle(
        fontSize: 17.0,
        color: Colors.grey,
      ),
    );
  }
}
