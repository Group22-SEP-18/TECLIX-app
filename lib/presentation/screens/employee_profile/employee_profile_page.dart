import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/screens/employee_profile/widgets/expandable_card.dart';
import 'package:teclix/presentation/screens/employee_profile/widgets/header_clip_path.dart';
import 'package:teclix/presentation/screens/employee_profile/widgets/profile_attribute_text.dart';
import 'package:teclix/presentation/screens/employee_profile/widgets/profile_option_card.dart';
import 'package:teclix/presentation/screens/employee_profile/widgets/sub_heading_text.dart';

class EmployeeProfilePage extends StatelessWidget {
  static const String id = '/employee-profile';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(210.0),
          child: Stack(
            children: [
              ClipPath(
                clipper: HeaderClipPath(),
                child: Container(
                  color: ColorPrimary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: AppbarHeadingText(
                    title: 'Profile',
                    fontSize: 28.0,
                  ),
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 0.0,
                child: Material(
                  shape: CircleBorder(),
                  elevation: 1.0,
                  child: CircleAvatar(
                    radius: 70.0,
                    child: CircleAvatar(
                      radius: 70.0,
                      backgroundImage: Image.asset(
                        'static/images/profile_dummy.jpg',
                        fit: BoxFit.cover,
                      ).image,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'Binoy Peries',
                  style: TextStyle(color: ColorPrimary, fontSize: 28.0),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.trophy,
                        color: ColorGold,
                        size: 40.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        '1580 pts.',
                        style: TextStyle(color: ColorPrimary, fontSize: 30.0),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        FontAwesomeIcons.medal,
                        size: 40.0,
                        color: ColorToastRed,

                        // color: ColorGold,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        '3/21',
                        style: TextStyle(
                          color: ColorPrimary,
                          fontSize: 30.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Divider(
                thickness: 1.0,
              ),
              SizedBox(
                height: 25.0,
              ),
              SubHeading(
                title: 'Basic Info',
              ),
              ExpandableCard(
                collapsedInfo: 'Name',
                collapsedIcon: FontAwesomeIcons.addressBook,
                expandedChild: Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Row(
                    children: [
                      ProfileInfoAttrText(
                        attr: 'Binoy Peries',
                      ),
                    ],
                  ),
                ),
              ),
              ExpandableCard(
                collapsedInfo: 'Employee number',
                collapsedIcon: FontAwesomeIcons.idCard,
                expandedChild: Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Row(
                    children: [
                      ProfileInfoAttrText(
                        attr: 'EMP202323',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              SubHeading(
                title: 'Contact Info',
              ),
              ExpandableCard(
                collapsedInfo: 'Email address',
                collapsedIcon: FontAwesomeIcons.envelope,
                expandedChild: Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Row(
                    children: [
                      ProfileInfoAttrText(
                        attr: 'johndoe@gmail.com',
                      ),
                    ],
                  ),
                ),
              ),
              ExpandableCard(
                collapsedInfo: 'Phone number',
                collapsedIcon: FontAwesomeIcons.mobileAlt,
                expandedChild: Padding(
                  padding: const EdgeInsets.only(left: 20.0, bottom: 10.0),
                  child: Row(
                    children: [
                      ProfileInfoAttrText(
                        attr: '+94 77 123 4567',
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              CommonPadding(
                child: Row(
                  children: [
                    Expanded(
                      child: ProfileOptionCard(
                        coverColor: ColorBlue,
                        image: 'static/images/profile_sales_card.png',
                        optionText: 'Sales',
                      ),
                    ),
                    Expanded(
                      child: ProfileOptionCard(
                        coverColor: ColorGold,
                        image: 'static/images/winner.png',
                        optionText: 'Leaderboard Scheme',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
