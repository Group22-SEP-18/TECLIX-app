import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class ProfilePicAvatar extends StatelessWidget {
  final double circleRadius;
  final String picture;
  final double blurRad;
  final double spreadRad;

  const ProfilePicAvatar(
      {this.circleRadius, this.picture, this.blurRad, this.spreadRad});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: blurRad,
            color: ColorPrimary,
            spreadRadius: spreadRad,
          )
        ],
      ),
      child: CircleAvatar(
        radius: circleRadius + 2,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: circleRadius,
          backgroundImage: Image.asset(
            picture,
          ).image,
        ),
      ),
    );
  }
}
