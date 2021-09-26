import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/constants/utils.dart';

class SalesStatCard extends StatelessWidget {
  final Color primary;
  final String title;
  final double amount;
  final String image;

  const SalesStatCard({this.primary, this.title, this.amount, this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: primary),
      ),
      elevation: 3,
      child: Container(
        height: 170.0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 90.0,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 21.0,
                  color: primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                Utils.returnCurrency(amount),
                style: TextStyle(
                  fontSize: 30.0,
                  color: ColorHeadingFont,
                ),
              ),
              SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
