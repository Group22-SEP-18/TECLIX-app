import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/screens/employee_profile/widgets/header_clip_path.dart';

class EmployeeProfilePage extends StatelessWidget {
  static const String id = '/employee-profile';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: Stack(
            children: [
              ClipPath(
                clipper: HeaderClipPath(),
                child: Container(
                  color: ColorPrimary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
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
            children: [
              SizedBox(
                height: 20.0,
              ),
              Center(
                child: Text(
                  'Binoy Peries',
                  style: TextStyle(color: ColorPrimary, fontSize: 30.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
