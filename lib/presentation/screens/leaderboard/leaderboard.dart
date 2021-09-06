import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/screens/leaderboard/widgets/LeaderboardCard.dart';
import 'package:teclix/presentation/screens/leaderboard/widgets/leaderboard_header.dart';
import 'package:teclix/presentation/screens/leaderboard/widgets/profile_picture_avatar.dart';

class LeaderboardPage extends StatelessWidget {
  static const String id = '/leaderboard';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(400.0),
          child: Stack(
            children: [
              ClipPath(
                clipper: LeaderboardHeaderClipPath(),
                child: Container(
                  color: ColorDarkGreen,
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: AppbarHeadingText(
                    title: 'Leaderboard',
                    fontSize: 28.0,
                  ),
                ),
              ),
              Positioned(
                top: 80,
                left: 0.0,
                right: 0.0,
                child: Column(
                  children: [
                    Icon(
                      FontAwesomeIcons.crown,
                      size: 50.0,
                      color: ColorGold,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ProfilePicAvatar(
                      circleRadius: 80.0,
                      picture: 'static/images/profile_dummy.jpg',
                      blurRad: 20,
                      spreadRad: 10,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      '8906 pts.',
                      style: TextStyle(fontSize: 30.0, color: Colors.white),
                    ),
                    Text(
                      'Binoy Peries',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    )
                  ],
                ),
              ),
              Positioned(
                left: 15.0,
                top: 100,
                child: Column(
                  children: [
                    Text(
                      '2',
                      style: TextStyle(fontSize: 30.0, color: Colors.white70),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ProfilePicAvatar(
                      circleRadius: 55.0,
                      picture: 'static/images/profile_dummy.jpg',
                      blurRad: 10,
                      spreadRad: 5,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      '8600 pts.',
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                    Text(
                      'John Perera',
                      style: TextStyle(fontSize: 13.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 15.0,
                top: 100,
                child: Column(
                  children: [
                    Text(
                      '3',
                      style: TextStyle(fontSize: 30.0, color: Colors.white70),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ProfilePicAvatar(
                      circleRadius: 55.0,
                      picture: 'static/images/profile_dummy.jpg',
                      blurRad: 10,
                      spreadRad: 5,
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      '8050 pts.',
                      style: TextStyle(fontSize: 22.0, color: Colors.white),
                    ),
                    Text(
                      'Sam Peries',
                      style: TextStyle(fontSize: 13.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 25.0,
              ),
              LeaderboardCard(
                cardColor: ColorGold,
                image: 'static/images/profile_dummy.jpg',
                name: 'You',
                points: '5202',
                rank: '15',
              ),
              SizedBox(
                height: 10.0,
              ),
              LeaderboardCard(
                image: 'static/images/profile_dummy.jpg',
                name: 'Emma Stone',
                points: '6850',
                rank: '4',
              ),
              SizedBox(
                height: 10.0,
              ),
              LeaderboardCard(
                image: 'static/images/profile_dummy.jpg',
                name: 'Emma Stone',
                points: '6850',
                rank: '5',
              ),
              SizedBox(
                height: 10.0,
              ),
              LeaderboardCard(
                image: 'static/images/profile_dummy.jpg',
                name: 'Emma Stone',
                points: '6850',
                rank: '6',
              ),
              SizedBox(
                height: 10.0,
              ),
              LeaderboardCard(
                image: 'static/images/profile_dummy.jpg',
                name: 'Emma Stone',
                points: '6850',
                rank: '7',
              ),
              SizedBox(
                height: 10.0,
              ),
              LeaderboardCard(
                image: 'static/images/profile_dummy.jpg',
                name: 'Emma Stone',
                points: '6850',
                rank: '8',
              ),
              SizedBox(
                height: 10.0,
              ),
              LeaderboardCard(
                image: 'static/images/profile_dummy.jpg',
                name: 'Emma Stone',
                points: '6850',
                rank: '9',
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
