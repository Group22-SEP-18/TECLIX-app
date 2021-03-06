import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/screens/leaderboard/widgets/profile_picture_avatar.dart';

class SearchResultCard extends StatelessWidget {
  final String shopName;
  final String ownerFistName;
  final String ownerLastName;
  final String profilePicUrl;
  final Function directTo;
  const SearchResultCard({
    this.shopName,
    this.ownerFistName,
    this.ownerLastName,
    this.profilePicUrl,
    this.directTo,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: directTo,
      child: Card(
        color: Colors.grey.shade200,
        margin: EdgeInsets.zero,
        shape: Border.symmetric(
          horizontal: BorderSide(color: Colors.grey, width: 0.5),
        ),
        child: Container(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfilePicAvatar(
                  blurRad: 0,
                  circleRadius: 32,
                  spreadRad: 0,
                  picture: profilePicUrl,
                ),
                SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shopName,
                      style: TextStyle(
                        color: ColorPrimary,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      ownerFistName + ' ' + ownerLastName,
                      style: TextStyle(
                        color: ColorPrimary,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
