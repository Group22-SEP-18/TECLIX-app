import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class SearchField extends StatelessWidget {
  final Function onSubmit;
  final String hintText;

  const SearchField({this.onSubmit, this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            )),
            child: Center(
              child: Icon(
                FontAwesomeIcons.search,
                color: ColorPrimary,
                size: 28.0,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              onSubmitted: onSubmit,
              style: TextStyle(
                fontSize: 18.0,
                color: ColorHeadingFont,
              ),
              // controller: searchController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: 18.0,
                  color: ColorPrimary,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
