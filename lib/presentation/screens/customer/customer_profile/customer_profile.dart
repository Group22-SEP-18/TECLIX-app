import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_back_btn.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/screens/customer/customer_profile/widgets/customer_profile_card.dart';
import 'package:teclix/presentation/screens/customer/customer_profile/widgets/customer_profile_clip_path.dart';

import 'package:teclix/presentation/screens/leaderboard/widgets/profile_picture_avatar.dart';

class CustomerProfile extends StatelessWidget {
  static const String id = '/customer-profile';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(350.0),
          child: Stack(
            children: [
              ClipPath(
                clipper: CustomerProfileClipPath(),
                child: Container(
                  color: ColorPrimary,
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                  child: HeaderBackButton(
                      whenTapped: () => Navigator.pop(context)),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: AppbarHeadingText(title: 'Customer Profile'),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ProfilePicAvatar(
                  spreadRad: 0.0,
                  blurRad: 0.0,
                  circleRadius: 80.0,
                  picture: 'static/images/profile_dummy.jpg',
                ),
              ),
              Positioned(
                bottom: 50.0,
                left: 0.0,
                right: 0.0,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Store Name',
                    style: TextStyle(fontSize: 28.0, color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                bottom: 20.0,
                left: 0.0,
                right: 0.0,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'owner Name',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 25.0,
              ),
              CustomerProfileCard(
                icon: Icons.email,
                infoText: 'Email',
                infoValue: 'b@gmail.com',
              ),
              CustomerProfileCard(
                icon: Icons.phone_iphone,
                infoText: 'Mobile',
                infoValue: '+94 77 123 4567',
              ),
              CustomerProfileCard(
                icon: Icons.location_on,
                infoText: 'Address',
                infoValue:
                    '4A, Hilda lane' + '\n' + 'Dehiwala' + '\n' + 'Colombo',
              ),
              CustomerProfileCard(
                icon: Icons.loyalty,
                infoText: 'Loyalty Points',
                infoValue: '560.0',
              ),
              CustomerProfileCard(
                icon: Icons.credit_card,
                infoText: 'Current Outstanding',
                infoValue: 'Rs. 2500',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
