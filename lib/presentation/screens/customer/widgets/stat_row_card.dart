import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class StatRowCard extends StatelessWidget {
  final String statAttr;
  final String statValue;

  const StatRowCard({this.statAttr, this.statValue});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 15.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            statAttr,
            style: TextStyle(fontSize: 21.0, color: Colors.grey),
          ),
          Text(
            statValue,
            style: TextStyle(fontSize: 20.0, color: ColorPrimary),
          ),
        ],
      ),
    );
  }
}
