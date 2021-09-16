import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final String itemName;
  final double price;
  final Function addFunc;
  final Function removeFunc;
  final int selectedAmount;

  const ItemCard({
    this.imageUrl,
    this.itemName,
    this.price,
    this.addFunc,
    this.removeFunc,
    this.selectedAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: ColorPrimary),
      ),
      elevation: 3,
      child: Container(
        height: 225.0,
        width: 195.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              height: 130.0,
            ),
            Text(
              itemName,
              style: TextStyle(
                color: ColorHeadingFont,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            Text(
              'Rs ' + price.toString(),
              style: TextStyle(
                color: ColorHeadingFont,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: removeFunc,
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    elevation: 3.0,
                  ),
                ),
                Container(
                  height: 35.0,
                  width: 38.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.shade200,
                  ),
                  child: Center(
                    child: Text(
                      selectedAmount.toString(),
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                        color: ColorMintGreen,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: addFunc,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    elevation: 3.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5.0,
            ),
          ],
        ),
      ),
    );
  }
}
