import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';

class ProfileInfoCard extends StatelessWidget {
  final String headingText;
  final Widget child;
  const ProfileInfoCard({this.headingText, this.child});

  @override
  Widget build(BuildContext context) {
    return CommonPadding(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          margin: const EdgeInsets.only(bottom: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
            border: Border.all(color: ColorPrimaryLight),
            boxShadow: [
              BoxShadow(
                color: ColorPrimary,
                offset: Offset(0.0, 1.0),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headingText,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: ColorPrimary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0),
                  child: Divider(
                    height: 0.0,
                    color: ColorHeadingFont,
                    thickness: 0.5,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                child
              ],
            ),
          ),
        ),
      ),
    );
  }
}
