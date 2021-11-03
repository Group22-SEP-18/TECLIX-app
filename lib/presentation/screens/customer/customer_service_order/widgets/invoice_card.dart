import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class InvoiceCard extends StatelessWidget {
  final String itemName;
  final double price;
  final int quntity;

  const InvoiceCard({
    this.itemName,
    this.price,
    this.quntity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        height: 100.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemName,
                style: TextStyle(
                  color: ColorPrimary,
                  fontSize: 23.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Rs ' + price.toString(),
                    style: TextStyle(
                      color: ColorHeadingFont,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      '/unit',
                      style: TextStyle(
                        color: ColorHeadingFont,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    'x' + quntity.toString(),
                    style: TextStyle(
                      color: ColorHeadingFont,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
