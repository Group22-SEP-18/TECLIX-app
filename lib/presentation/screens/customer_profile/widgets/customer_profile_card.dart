import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';

class CustomerProfileCard extends StatelessWidget {
  final IconData icon;
  final String infoText;
  final String infoValue;

  const CustomerProfileCard({this.icon, this.infoText, this.infoValue});

  @override
  Widget build(BuildContext context) {
    return CommonPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: [
              Icon(
                icon,
                color: Colors.grey,
                size: 30.0,
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                infoText,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18.0,
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50.0),
            child: Text(
              infoValue,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Divider(
            color: Colors.grey.shade400,
            height: 0.0,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}
