import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class OrderListCard extends StatelessWidget {
  final String image;
  final String itemName;
  final double price;
  final int quntity;

  const OrderListCard({
    this.image,
    this.itemName,
    this.price,
    this.quntity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: ColorPrimary),
        ),
        elevation: 3,
        child: Container(
          height: 80.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(image),
              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: TextStyle(
                      color: ColorPrimary,
                      fontSize: 22.0,
                    ),
                  ),
                  Text(
                    'x' + quntity.toString(),
                    style: TextStyle(
                      color: ColorHeadingFont,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Text(
                'Rs ' + price.toString(),
                style: TextStyle(
                  color: ColorHeadingFont,
                  fontSize: 20.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  '/unit',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
