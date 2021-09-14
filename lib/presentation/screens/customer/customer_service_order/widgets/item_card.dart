import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';

class ItemCard extends StatelessWidget {
  final String imageUrl;
  final String itemName;
  final double price;
  final Function addFunc;
  final Function removeFunc;

  const ItemCard(
      {this.imageUrl,
      this.itemName,
      this.price,
      this.addFunc,
      this.removeFunc});

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
