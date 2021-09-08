import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/screens/vehicle/widgets/vehicle_stat_card.dart';

class ItemDetailCard extends StatelessWidget {
  final Widget child;

  const ItemDetailCard({this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: VehicleStatCard(
        borderColor: Colors.white,
        cardColor: ColorPrimaryLight,
        child: Container(
            height: 130.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  ColorPrimary,
                  ColorMintGreen,
                ],
              ),
            ),
            child: child),
      ),
    );
  }
}
