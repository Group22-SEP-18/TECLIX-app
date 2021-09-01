import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/screens/employee_profile/widgets/expandable_card.dart';
import 'package:teclix/presentation/screens/employee_profile/widgets/header_clip_path.dart';
import 'package:teclix/presentation/screens/employee_profile/widgets/profile_attribute_text.dart';
import 'package:teclix/presentation/screens/employee_profile/widgets/profile_attribute_value_text.dart';
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
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
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
                  style: TextStyle(color: ColorPrimary, fontSize: 30.0),
                ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileInfoAttrText(
                            attr: 'First Name',
                          ),
                          ProfileAttrValueText(
                            attrValue: 'Binoy',
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileInfoAttrText(
                            attr: 'Last Name',
                          ),
                          ProfileAttrValueText(
                            attrValue: 'Peries',
                          ),
                        ],
                      ),
                      Spacer()
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
            ],
          ),
        ),
      ),
    );
  }
}
