import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/utils.dart';

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
          height: 100.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.network(
                  image,
                  height: 60.0,
                ),
              ),
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
                Utils.returnCurrency(price, 'Rs '),
                style: TextStyle(
                  color: ColorHeadingFont,
                  fontSize: 18.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  '/unit',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(
                width: 5.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
