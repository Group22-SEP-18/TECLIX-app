import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:teclix/data/url_constants.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_bloc.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_event.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_state.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/screens/leaderboard/widgets/leaderboard_header.dart';
import 'package:teclix/presentation/screens/leaderboard/widgets/profile_picture_avatar.dart';

class LeaderboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final leaderboardbloc = BlocProvider.of<LeaderboardBloc>(context);

    return SafeArea(
      child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
        buildWhen: (prev, cur) => prev.loadingData != cur.loadingData,
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(400.0),
              child: state.loadingData
                  ? Center(child: CircularProgressIndicator())
                  : Stack(
                      children: [
                        ClipPath(
                          clipper: LeaderboardHeaderClipPath(),
                          child: Container(
                            color: ColorPrimary,
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
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () =>
                                leaderboardbloc.add(FetchLeaderboardEvent()),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 15.0, top: 20.0),
                              child: Icon(
                                Icons.refresh_rounded,
                                color: Colors.white,
                                size: 40.0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 80,
                          left: 0.0,
                          right: 0.0,
                          child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
                            builder: (context, state) {
                              return Column(
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
                                    picture: state.leaderboard.length > 0
                                        ? state.leaderboard[0].salesperson
                                            .profilePicture
                                        : UrlConstants.dummyprofileImage,
                                    blurRad: 20,
                                    spreadRad: 10,
                                  ),
                                  SizedBox(
                                    height: 15.0,
                                  ),
                                  Text(
                                    state.leaderboard.length > 0
                                        ? state.leaderboard[0]
                                                .pointsCurrentMonth +
                                            'pts.'
                                        : '0',
                                    style: TextStyle(
                                        fontSize: 30.0, color: Colors.white),
                                  ),
                                  Text(
                                    state.leaderboard.length > 0
                                        ? state.leaderboard[0].salesperson
                                                .firstName +
                                            ' ' +
                                            state.leaderboard[0].salesperson
                                                .lastName
                                        : 'name',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white),
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                        Positioned(
                          left: 15.0,
                          top: 100,
                          child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: 30.0, color: Colors.white70),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  ProfilePicAvatar(
                                    circleRadius: 55.0,
                                    picture: state.leaderboard.length > 0
                                        ? state.leaderboard[1].salesperson
                                            .profilePicture
                                        : UrlConstants.dummyprofileImage,
                                    blurRad: 10,
                                    spreadRad: 5,
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  Text(
                                    state.leaderboard.length > 0
                                        ? state.leaderboard[1]
                                                .pointsCurrentMonth +
                                            'pts.'
                                        : '0',
                                    style: TextStyle(
                                        fontSize: 22.0, color: Colors.white),
                                  ),
                                  Text(
                                    state.leaderboard.length > 0
                                        ? state.leaderboard[1].salesperson
                                                .firstName +
                                            ' ' +
                                            state.leaderboard[1].salesperson
                                                .lastName
                                        : 'name',
                                    style: TextStyle(
                                        fontSize: 13.0, color: Colors.white),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Positioned(
                          right: 15.0,
                          top: 100,
                          child: BlocBuilder<LeaderboardBloc, LeaderboardState>(
                            builder: (context, state) {
                              return Column(
                                children: [
                                  Text(
                                    '3',
                                    style: TextStyle(
                                        fontSize: 30.0, color: Colors.white70),
                                  ),
                                  SizedBox(
                                    height: 20.0,
                                  ),
                                  ProfilePicAvatar(
                                    circleRadius: 55.0,
                                    picture: state.leaderboard.length > 0
                                        ? state.leaderboard[2].salesperson
                                            .profilePicture
                                        : UrlConstants.dummyprofileImage,
                                    blurRad: 10,
                                    spreadRad: 5,
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  Text(
                                    state.leaderboard.length > 0
                                        ? state.leaderboard[2]
                                                .pointsCurrentMonth +
                                            'pts.'
                                        : '0',
                                    style: TextStyle(
                                        fontSize: 22.0, color: Colors.white),
                                  ),
                                  Text(
                                    state.leaderboard.length > 0
                                        ? state.leaderboard[2].salesperson
                                                .firstName +
                                            ' ' +
                                            state.leaderboard[2].salesperson
                                                .lastName
                                        : 'name',
                                    style: TextStyle(
                                        fontSize: 13.0, color: Colors.white),
                                  ),
                                ],
                              );
                            },
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
                  // SizedBox(
                  //   height: 25.0,
                  // ),
                  // LeaderboardCard(
                  //   cardColor: ColorGold,
                  //   image: 'static/images/profile_dummy.jpg',
                  //   name: 'You',
                  //   points: '5202',
                  //   rank: '15',
                  // ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  // LeaderboardCard(
                  //   image: 'static/images/profile_dummy.jpg',
                  //   name: 'Emma Stone',
                  //   points: '6850',
                  //   rank: '4',
                  // ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  // LeaderboardCard(
                  //   image: 'static/images/profile_dummy.jpg',
                  //   name: 'Emma Stone',
                  //   points: '6850',
                  //   rank: '5',
                  // ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  // LeaderboardCard(
                  //   image: 'static/images/profile_dummy.jpg',
                  //   name: 'Emma Stone',
                  //   points: '6850',
                  //   rank: '6',
                  // ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  // LeaderboardCard(
                  //   image: 'static/images/profile_dummy.jpg',
                  //   name: 'Emma Stone',
                  //   points: '6850',
                  //   rank: '7',
                  // ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  // LeaderboardCard(
                  //   image: 'static/images/profile_dummy.jpg',
                  //   name: 'Emma Stone',
                  //   points: '6850',
                  //   rank: '8',
                  // ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  // LeaderboardCard(
                  //   image: 'static/images/profile_dummy.jpg',
                  //   name: 'Emma Stone',
                  //   points: '6850',
                  //   rank: '9',
                  // ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
