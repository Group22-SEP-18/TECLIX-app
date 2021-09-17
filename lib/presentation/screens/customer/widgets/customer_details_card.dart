import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/screens/leaderboard/widgets/profile_picture_avatar.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class CustomerDetailsCard extends StatelessWidget {
  final String profilePic;
  final String shop;
  final String owner;
  final String street;
  final String city;
  final String district;
  final double borderTop;

  const CustomerDetailsCard({
    this.profilePic,
    this.shop,
    this.owner,
    this.street,
    this.city,
    this.district,
    this.borderTop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderTop ?? 10.0),
          topRight: Radius.circular(borderTop ?? 10.0),
          bottomLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
        border: Border.all(color: ColorPrimary),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorPrimary,
            ColorMintGreen,
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePicAvatar(
              spreadRad: 0.0,
              blurRad: 0.0,
              circleRadius: 50.0,
              picture: profilePic,
            ),
            SizedBox(
              height: 8.0,
            ),
            Divider(
              height: 0.0,
              thickness: 1.0,
              color: Colors.white,
            ),
            SizedBox(
              height: 8.0,
            ),
            MainHeading(
              text: shop,
              color: Colors.white,
              fontSize: 25.0,
            ),
            SizedBox(
              height: 5.0,
            ),
            MainHeading(
              text: owner,
              fontSize: 20.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 8.0,
            ),
            MainHeading(
              color: Colors.white,
              fontSize: 19.0,
              text: street,
              fontWeight: FontWeight.w400,
            ),
            MainHeading(
              color: Colors.white,
              fontSize: 19.0,
              text: city,
              fontWeight: FontWeight.w400,
            ),
            MainHeading(
              color: Colors.white,
              fontSize: 19.0,
              text: district,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}
