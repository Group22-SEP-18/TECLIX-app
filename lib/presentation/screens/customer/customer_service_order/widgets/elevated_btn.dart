import 'package:flutter/material.dart';

class SoElevatedBtn extends StatelessWidget {
  final String btnText;
  final Color btnColor;
  final double btnWidth;

  const SoElevatedBtn({this.btnText, this.btnColor, this.btnWidth});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.qr_code_scanner_rounded,
            size: 30.0,
          ),
          SizedBox(
            width: 10.0,
          ),
          Text(
            btnText,
            style: TextStyle(
              fontSize: 22.0,
            ),
          ),
        ],
      ),
      style: ButtonStyle(
          elevation: MaterialStateProperty.all(5.0),
          backgroundColor: MaterialStateProperty.all(btnColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(
                color: Colors.white,
                width: 1.0,
              ),
            ),
          ),
          minimumSize:
              MaterialStateProperty.all(Size(btnWidth ?? 150.0, 50.0))),
    );
  }
}
