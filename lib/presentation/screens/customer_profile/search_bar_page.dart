import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_back_btn.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/screens/customer_profile/widgets/search_field.dart';

class SearchBarPage extends StatelessWidget {
  static const String id = '/customer-search';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(200.0),
          child: Container(
            color: ColorPrimary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                CommonPadding(
                  child: HeaderBackButton(
                    whenTapped: () => Navigator.pop(context),
                  ),
                ),
                Spacer(),
                CommonPadding(
                  child: SearchField(),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        body: Center(
          child: Image.asset(
            'static/images/customer_search.png',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
    );
  }
}
