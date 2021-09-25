import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/screens/signup/widgets/main_heading.dart';
import 'package:teclix/presentation/screens/vehicle/widgets/vehicle_stat_card.dart';

class ProductInfoCard extends StatelessWidget {
  final String productImage;
  final String productName;
  final String productPrice;
  final String productQuantity;

  const ProductInfoCard({
    this.productImage,
    this.productName,
    this.productPrice,
    this.productQuantity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: VehicleStatCard(
        cardHeight: 155.0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                    ),
                    child: Image.network(
                      productImage,
                      height: 150.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: MainHeading(
                            text: productName,
                            fontSize: 21.0,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        MainHeading(
                          text: 'Price :',
                          fontSize: 20.0,
                          color: ColorPrimary,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        MainHeading(
                          text: productPrice,
                          fontSize: 22.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MainHeading(
                          text: 'Quantity :',
                          fontSize: 20.0,
                          color: ColorPrimary,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        MainHeading(
                          text: productQuantity,
                          fontSize: 22.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
