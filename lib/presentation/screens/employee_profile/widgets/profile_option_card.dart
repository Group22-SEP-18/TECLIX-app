import 'package:flutter/material.dart';

class ProfileOptionCard extends StatelessWidget {
  final String image;
  final Color coverColor;
  final String optionText;

  const ProfileOptionCard({this.image, this.coverColor, this.optionText});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: coverColor),
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Container(
        height: 220.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              image,
              height: 180.0,
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: coverColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Center(
                  child: Text(
                    optionText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
