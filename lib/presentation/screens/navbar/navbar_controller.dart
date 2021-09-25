import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teclix/logic/bloc/root/root_bloc.dart';
import 'package:teclix/logic/bloc/root/root_state.dart';
import 'package:teclix/logic/bloc/salesperson_vehicle/salesperson_vehicle_provider.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/screens/customer/customer_main.dart';
import 'package:teclix/presentation/screens/employee/employee_profile/employee_profile_page.dart';
import 'package:teclix/presentation/screens/leaderboard/leaderboard.dart';
import 'package:teclix/presentation/screens/navbar/bottom_navbar.dart';
import 'package:teclix/presentation/screens/navbar/nav_tab_item.dart';
import 'package:teclix/presentation/screens/signin/welcome_page.dart';

class NavbarController extends StatefulWidget {
  static const String id = '/logged-in-main';

  @override
  State<StatefulWidget> createState() => NavbarControllerState();
}

class NavbarControllerState extends State<NavbarController> {
  // this is static property so other widget throughout the app
  // can access it simply by AppState.currentTab
  static int currentTab = 0;

  // list tabs here
  final List<NavbarTabItem> tabs = [
    NavbarTabItem(
      icon: Icons.supervised_user_circle,
      page: CustomerMain(),
      tabName: 'Customer',
    ),
    NavbarTabItem(
      icon: Icons.local_shipping,
      page: SalespersonVehicleProvider(),
      tabName: 'Vehicle',
    ),
    NavbarTabItem(
      icon: Icons.leaderboard,
      page: LeaderboardPage(),
      tabName: 'Leaderboard',
    ),
    NavbarTabItem(
      icon: Icons.account_circle,
      page: EmployeeProfilePage(),
      tabName: 'Profile',
    ),
  ];

  NavbarControllerState() {
    // indexing is necessary for proper funcationality
    // of determining which tab is active
    tabs.asMap().forEach((index, details) {
      details.setIndex(index);
    });
  }

  // sets current tab index
  // and update state
  void _selectTab(int index) {
    if (index == currentTab) {
      // pop to first route
      // if the user taps on the active tab
      tabs[index].key.currentState.popUntil((route) => route.isFirst);
    } else {
      // update the state
      // in order to repaint
      setState(() => currentTab = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope handle android back btn
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await tabs[currentTab].key.currentState.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (currentTab != 0) {
            // select 'main' tab
            _selectTab(0);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      // this is the base scaffold
      // don't put appbar in here otherwise you might end up
      // with multiple appbars on one screen
      // eventually breaking the app
      child: BlocListener<RootBloc, RootState>(
        listener: (context, state) {
          if (state.userLoginState == UserLoginState.LOGGED_OUT) {
            Navigator.pushReplacementNamed(context, WelcomePage.id);
            currentTab = 0;
          }
        },
        child: Scaffold(
          // indexed stack shows only one child
          backgroundColor: ColorPrimary,
          body: IndexedStack(
            index: currentTab,
            children: tabs.map((e) => e.page).toList(),
          ),
          // Bottom navigation
          bottomNavigationBar: BottomNavbar(
            onSelectTab: _selectTab,
            tabs: tabs,
          ),
        ),
      ),
    );
  }
}
