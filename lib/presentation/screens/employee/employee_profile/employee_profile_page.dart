import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:teclix/data/models/leaderboard.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_bloc.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_event.dart';
import 'package:teclix/logic/bloc/leaderboard/leaderboard_state.dart';
import 'package:teclix/logic/bloc/root/root_bloc.dart';
import 'package:teclix/logic/bloc/root/root_event.dart';
import 'package:teclix/logic/bloc/root/root_state.dart';
import 'package:teclix/logic/bloc/sales_report/sales_report_provider.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/common/constants/utils.dart';
import 'package:teclix/presentation/common/widgets/appbar_heading_text.dart';
import 'package:teclix/presentation/common/widgets/common_padding.dart';
import 'package:teclix/presentation/routing/routes.dart';
import 'package:teclix/presentation/screens/employee/employee_profile/widgets/expandable_card.dart';
import 'package:teclix/presentation/screens/employee/employee_profile/widgets/header_clip_path.dart';
import 'package:teclix/presentation/screens/employee/employee_profile/widgets/profile_attribute_text.dart';
import 'package:teclix/presentation/screens/employee/employee_profile/widgets/profile_option_card.dart';
import 'package:teclix/presentation/screens/employee/employee_profile/widgets/sub_heading_text.dart';
import 'package:teclix/presentation/screens/employee/leaderboard_Schema/leaderboard_schema_page.dart';

class EmployeeProfilePage extends StatelessWidget {
  static const String id = '/employee-profile';

  @override
  Widget build(BuildContext context) {
    final rootBloc = BlocProvider.of<RootBloc>(context);
    final leaderbordBloc = BlocProvider.of<LeaderboardBloc>(context);
    // leaderbordBloc.add(FetchLeaderboardEvent());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(210.0),
          child: Stack(
            children: [
              ClipPath(
                clipper: HeaderClipPath(),
                child: Container(
                  color: ColorPrimary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: AppbarHeadingText(
                    title: 'Profile',
                    fontSize: 28.0,
                  ),
                ),
              ),
              BlocBuilder<RootBloc, RootState>(
                buildWhen: (pre, cur) =>
                    pre.userLoginState != cur.userLoginState,
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 12.0, right: 15.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ElevatedButton(
                        child: Text(
                          'Logout',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(ColorPrimary),
                            elevation: MaterialStateProperty.all(0.0)),
                        onPressed: () =>
                            rootBloc.add(LogoutEvent(buildContext: context)),
                      ),
                    ),
                  );
                },
              ),
              BlocBuilder<RootBloc, RootState>(
                buildWhen: (prev, cur) =>
                    prev.loggedUser.profilePictureUrl !=
                    cur.loggedUser.profilePictureUrl,
                builder: (context, state) {
                  return Positioned(
                    left: 0.0,
                    right: 0.0,
                    bottom: 0.0,
                    child: Material(
                      shape: CircleBorder(),
                      elevation: 1.0,
                      child: CircleAvatar(
                        radius: 70.0,
                        child: CircleAvatar(
                          radius: 70.0,
                          backgroundImage: Image.network(
                            state.loggedUser.profilePictureUrl,
                            fit: BoxFit.cover,
                          ).image,
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        body: BlocBuilder<RootBloc, RootState>(
          buildWhen: (pre, cur) => pre.loading != cur.loading,
          builder: (context, state) {
            return state.loading
                ? Center(
                    child: Container(
                    height: 150.0,
                    width: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorPrimary,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            'Logging out!!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          height: 60.0,
                          width: 60.0,
                        ),
                      ],
                    ),
                  ))
                : SingleChildScrollView(
                    physics: ClampingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        BlocBuilder<RootBloc, RootState>(
                          buildWhen: (pre, cur) =>
                              pre.loggedUser.firstName !=
                              cur.loggedUser.firstName,
                          builder: (context, state) {
                            return Center(
                              child: Text(
                                toBeginningOfSentenceCase(
                                        state.loggedUser.firstName) +
                                    ' ' +
                                    toBeginningOfSentenceCase(
                                        state.loggedUser.lastName),
                                style: TextStyle(
                                    color: ColorPrimary, fontSize: 28.0),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                FontAwesomeIcons.trophy,
                                size: 36.0,
                                color: ColorGold,
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              BlocBuilder<LeaderboardBloc, LeaderboardState>(
                                buildWhen: (pre, cur) =>
                                    pre.loadingData != cur.loadingData,
                                builder: (context, state) {
                                  Map<String, dynamic> user =
                                      Leaderboard.getPointsByCustomerId(
                                          list: state.leaderboard,
                                          id: state.loggedUser);
                                  return Row(
                                    children: [
                                      Text(
                                        user['rank'].toString().padLeft(1, '0'),
                                        style: TextStyle(
                                          color: ColorGold,
                                          fontSize: 35.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: Text(
                                          '/' +
                                              state.leaderboard.length
                                                  .toString(),
                                          style: TextStyle(
                                            color: ColorMintGreen,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        BlocBuilder<LeaderboardBloc, LeaderboardState>(
                          buildWhen: (pre, cur) =>
                              pre.loadingData != cur.loadingData,
                          builder: (context, state) {
                            Map<String, dynamic> user =
                                Leaderboard.getPointsByCustomerId(
                                    list: state.leaderboard,
                                    id: state.loggedUser);
                            return Card(
                              color: Colors.grey.shade100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: ColorPrimaryLight,
                                ),
                              ),
                              child: state.loadingData
                                  ? Center(
                                      child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15.0),
                                      child: CircularProgressIndicator(),
                                    ))
                                  : Column(
                                      children: [
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Spacer(),
                                            Text(
                                              'Leaderboard Stats',
                                              style: TextStyle(
                                                color: ColorMintGreen,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Spacer(),
                                            GestureDetector(
                                              onTap: () => leaderbordBloc
                                                  .add(FetchLeaderboardEvent()),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: Icon(
                                                  Icons.refresh_rounded,
                                                  color: ColorPrimary,
                                                  size: 28.0,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 5.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    'Today',
                                                    style: TextStyle(
                                                        color: ColorMintGreen,
                                                        fontSize: 20.0),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    Utils.returnCurrency(
                                                        double.parse(
                                                            user['details']
                                                                .pointsToday),
                                                        ''),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 22.0),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 60.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  width: 0.0,
                                                  color: ColorMintGreen,
                                                  endIndent: 5.0,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    'Current Month',
                                                    style: TextStyle(
                                                        color: ColorMintGreen,
                                                        fontSize: 20.0),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    Utils.returnCurrency(
                                                        double.parse(user[
                                                                'details']
                                                            .pointsCurrentMonth),
                                                        ''),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 22.0),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 60.0,
                                                child: VerticalDivider(
                                                  thickness: 1.0,
                                                  width: 0.0,
                                                  color: ColorMintGreen,
                                                  endIndent: 5.0,
                                                ),
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    'All Time',
                                                    style: TextStyle(
                                                        color: ColorMintGreen,
                                                        fontSize: 20.0),
                                                  ),
                                                  SizedBox(
                                                    height: 5.0,
                                                  ),
                                                  Text(
                                                    Utils.returnCurrency(
                                                        double.parse(
                                                            user['details']
                                                                .pointsAllTime),
                                                        ''),
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontSize: 22.0),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Divider(
                          thickness: 1.0,
                        ),
                        SubHeading(
                          title: 'Basic Info',
                        ),
                        ExpandableCard(
                          collapsedInfo: 'Name',
                          collapsedIcon: FontAwesomeIcons.addressBook,
                          expandedChild: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, bottom: 10.0),
                            child: Row(
                              children: [
                                BlocBuilder<RootBloc, RootState>(
                                  buildWhen: (pre, cur) =>
                                      pre.loggedUser.firstName !=
                                      cur.loggedUser.firstName,
                                  builder: (context, state) {
                                    return ProfileInfoAttrText(
                                      attr: toBeginningOfSentenceCase(
                                              state.loggedUser.firstName) +
                                          ' ' +
                                          toBeginningOfSentenceCase(
                                              state.loggedUser.lastName),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        ExpandableCard(
                          collapsedInfo: 'Employee number',
                          collapsedIcon: FontAwesomeIcons.idCard,
                          expandedChild: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, bottom: 10.0),
                            child: Row(
                              children: [
                                BlocBuilder<RootBloc, RootState>(
                                  buildWhen: (pre, cur) =>
                                      pre.loggedUser.employeeNo !=
                                      cur.loggedUser.employeeNo,
                                  builder: (context, state) {
                                    return ProfileInfoAttrText(
                                      attr: state.loggedUser.employeeNo,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        SubHeading(
                          title: 'Contact Info',
                        ),
                        ExpandableCard(
                          collapsedInfo: 'Email address',
                          collapsedIcon: FontAwesomeIcons.envelope,
                          expandedChild: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, bottom: 10.0),
                            child: Row(
                              children: [
                                BlocBuilder<RootBloc, RootState>(
                                  buildWhen: (pre, cur) =>
                                      pre.loggedUser.email !=
                                      cur.loggedUser.email,
                                  builder: (context, state) {
                                    return ProfileInfoAttrText(
                                      attr: state.loggedUser.email,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        ExpandableCard(
                          collapsedInfo: 'Phone number',
                          collapsedIcon: FontAwesomeIcons.mobileAlt,
                          expandedChild: Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, bottom: 10.0),
                            child: Row(
                              children: [
                                BlocBuilder<RootBloc, RootState>(
                                  buildWhen: (pre, cur) =>
                                      pre.loggedUser.contactNo !=
                                      cur.loggedUser.contactNo,
                                  builder: (context, state) {
                                    return ProfileInfoAttrText(
                                      attr: state.loggedUser.contactNo,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        CommonPadding(
                          child: Row(
                            children: [
                              Expanded(
                                child: ProfileOptionCard(
                                  coverColor: ColorBlue,
                                  image: 'static/images/profile_sales_card.png',
                                  optionText: 'Sales',
                                  onSelect: () => Navigator.of(context).push(
                                    Routes.getMaterialPageRoute(
                                        SalesReportProvider.id, context),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ProfileOptionCard(
                                  coverColor: ColorGold,
                                  image: 'static/images/winner.png',
                                  optionText: 'Leaderboard Scheme',
                                  onSelect: () => Navigator.of(context).push(
                                    Routes.getMaterialPageRoute(
                                        LeaderboardSchemaPage.id, context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        )
                      ],
                    ),
                  );
          },
        ),
      ),
    );
  }
}
