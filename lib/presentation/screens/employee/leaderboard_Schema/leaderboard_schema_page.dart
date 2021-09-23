import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_back_btn.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/screens/employee/leaderboard_Schema/schema_card.dart';

class LeaderboardSchemaPage extends StatelessWidget {
  static const String id = '/leaderboard-schema';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                  title: 'Leaderboard Schema',
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 25.0,
              ),
              SchemaCard(
                title: 'Customer Registration',
                image: 'static/images/schema_cus.png',
                primaryColor: ColorBlue,
                text: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                      style: TextStyle(color: ColorHeadingFont, fontSize: 20.0),
                      children: [
                        TextSpan(
                          text:
                              'For every new customer registration, you will be awarded ',
                        ),
                        TextSpan(
                          text: '200 ',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: ColorBlue),
                        ),
                        TextSpan(
                          text: 'points.',
                        ),
                      ]),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SchemaCard(
                title: 'Service Order Creation',
                image: 'static/images/schema_so.png',
                primaryColor: ColorMintGreen,
                text: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(color: ColorHeadingFont, fontSize: 20.0),
                    children: [
                      TextSpan(
                        text:
                            'For every new service order, you will be awarded ',
                      ),
                      TextSpan(
                        text: '400 ',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: ColorMintGreen),
                      ),
                      TextSpan(
                        text: 'points.',
                      ),
                      TextSpan(
                        text: ' In addition to that',
                      ),
                      TextSpan(
                        text: ' 10% ',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: ColorMintGreen),
                      ),
                      TextSpan(
                        text: 'of the total amount will be added as points.',
                      ),
                      TextSpan(
                        text:
                            ' However, this is only valid if the amount is collected at the time of delivery. Otherwise, you will on;y be awarded 300 points. ',
                        style: TextStyle(color: ColorMintGreen),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              SchemaCard(
                title: 'Late Payment Collection',
                image: 'static/images/schema_late.png',
                primaryColor: ColorGold,
                text: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    style: TextStyle(color: ColorHeadingFont, fontSize: 20.0),
                    children: [
                      TextSpan(
                        text:
                            'For every late payment collection, you will be awarded ',
                      ),
                      TextSpan(
                        text: '250 ',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: ColorGold),
                      ),
                      TextSpan(
                        text: 'points.',
                      ),
                      TextSpan(
                        text: ' In addition to that',
                      ),
                      TextSpan(
                        text: ' 5% ',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: ColorGold),
                      ),
                      TextSpan(
                        text: 'of the total amount will be added as points.',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
