import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/screens/leaderboard/widgets/profile_picture_avatar.dart';

class LeaderboardCard extends StatelessWidget {
  final String rank;
  final String image;
  final String name;
  final String points;
  final cardColor;
  const LeaderboardCard(
      {this.rank, this.image, this.name, this.points, this.cardColor});

  @override
  Widget build(BuildContext context) {
    return CommonPadding(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 2,
        color: cardColor ?? ColorDarkGreen,
        child: Container(
          height: 80.0,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  rank,
                  style: TextStyle(fontSize: 30.0, color: Colors.white),
                ),
                ProfilePicAvatar(
                  blurRad: 0,
                  circleRadius: 50,
                  spreadRad: 0,
                  picture: image,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                SizedBox(
                  width: 25.0,
                ),
                Spacer(),
                Text(
                  points,
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
