import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/common/widgets/rounded_button.dart';
import 'package:teclix/presentation/screens/signup/widgets/infoText.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';

class SignupStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                //temp
                child: Image.asset('static/images/test.png'),
              ),
              MainHeading(
                text: "Welcome!!!",
                fontSize: 30.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              CommonPadding(
                child: InfoText(
                  text:
                      " 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ullamcorper nulla ex, "
                      "vitae tempus lacus condimentum vel. Praesent semper, "
                      "lectus in dictum scelerisque, erat Leo viverra sem, non sagittis est diam ut nisl',",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          CommonPadding(
            child: RoundedButton(
              title: 'Create Account',
              titleColor: Colors.white,
              colour: ColorPrimary,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
