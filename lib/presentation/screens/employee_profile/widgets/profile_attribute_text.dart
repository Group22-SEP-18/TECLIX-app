import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class ProfileInfoAttrText extends StatelessWidget {
  final String attr;

  const ProfileInfoAttrText({@required this.attr});

  @override
  Widget build(BuildContext context) {
    return Text(
      attr,
      style: TextStyle(
        fontSize: 20.0,
        color: ColorDarkGreen,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
