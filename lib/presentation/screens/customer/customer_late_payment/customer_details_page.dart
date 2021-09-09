import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_back_btn.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/routing/routes.dart';
import 'package:teclix/presentation/screens/customer/customer_late_payment/payment_details.dart';
import 'package:teclix/presentation/screens/leaderboard/widgets/profile_picture_avatar.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class CustomerDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0.0,
          title: Stack(
            children: [
              Positioned(
                left: 10.0,
                top: 0.0,
                child: HeaderBackButton(
                  whenTapped: () => Navigator.pop(context),
                ),
              ),
              Align(
                child: AppbarHeadingText(
                  title: 'Customer Details',
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: CommonPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                          picture: 'static/images/profile_dummy.jpg',
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
                          text: 'Gamini Stores (Pvt) Ltd',
                          color: Colors.white,
                          fontSize: 25.0,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        MainHeading(
                          text: 'Owner Name',
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
                          text: '4A, Hilda lane',
                          fontWeight: FontWeight.w400,
                        ),
                        MainHeading(
                          color: Colors.white,
                          fontSize: 19.0,
                          text: 'Dehiwala',
                          fontWeight: FontWeight.w400,
                        ),
                        MainHeading(
                          color: Colors.white,
                          fontSize: 19.0,
                          text: 'Colombo',
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                MainHeading(
                  text: 'Current Outstanding',
                  fontSize: 25.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 250,
                        child: Image.asset(
                          'static/images/coins.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'Rs 25,600',
                        style: TextStyle(
                            fontSize: 45.0,
                            color: ColorPrimary,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                RoundedButton(
                  title: 'Pay',
                  titleColor: Colors.white,
                  colour: ColorPrimary,
                  onPressed: () {
                    Navigator.of(context).push(
                      Routes.getMaterialPageRoute(PaymentDetail.id, context),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
