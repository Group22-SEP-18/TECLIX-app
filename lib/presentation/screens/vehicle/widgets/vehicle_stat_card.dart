import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class VehicleStatCard extends StatelessWidget {
  final Widget child;
  final Color cardColor;
  final Color borderColor;
  const VehicleStatCard({this.cardColor, this.child, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: cardColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: borderColor ?? ColorPrimary),
        ),
        elevation: 3,
        child: child);
  }
}
