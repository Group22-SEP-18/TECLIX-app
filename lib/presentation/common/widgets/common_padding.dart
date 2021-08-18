import 'package:flutter/material.dart';

class CommonPadding extends StatelessWidget {
  final Widget child;
  CommonPadding({this.child});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: child,
    );
  }
}
