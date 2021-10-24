import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

showInternetConnectionDialog(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Center(
          child: Text(
            'No Internet Connection!!',
            style: TextStyle(
              color: ColorToastRed,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        content: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Please check your internet settings.',
                style: TextStyle(fontSize: 18.0, color: Colors.grey),
              ),
            ],
          ),
        ),
      );
    },
  );
}
