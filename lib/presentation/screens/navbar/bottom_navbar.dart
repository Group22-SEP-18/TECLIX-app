import 'package:flutter/material.dart';
import 'package:teclix/presentation/common/constants/TeclixColors.dart';
import 'package:teclix/presentation/screens/navbar/nav_tab_item.dart';
import 'package:teclix/presentation/screens/navbar/navbar_controller.dart';

class BottomNavbar extends StatelessWidget {
  BottomNavbar({
    this.onSelectTab,
    this.tabs,
  });
  final ValueChanged<int> onSelectTab;
  final List<NavbarTabItem> tabs;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 20.0,
      //to remove the bottom padding
      selectedFontSize: 0.0,

      type: BottomNavigationBarType.fixed,
      items: tabs
          .map(
            (e) => _buildItem(
              index: e.getIndex(),
              icon: e.icon,
              tabName: e.tabName,
              context: context,
            ),
          )
          .toList(),
      onTap: (index) => onSelectTab(
        index,
      ),
    );
  }

  BottomNavigationBarItem _buildItem(
      {int index, IconData icon, String tabName, BuildContext context}) {
    return BottomNavigationBarItem(
      icon: Container(
        decoration: BoxDecoration(
          color: _containeColor(index: index),
          border: Border(
            top: BorderSide(
              color: _containeTopBorderColor(index: index),
              width: 2.5,
            ),
          ),
        ),
        height: 55.0,
        width: MediaQuery.of(context).size.width / 3,
        // color: Colors.yellow,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: _tabColor(index: index),
              size: 32.0,
            ),
            Text(
              tabName,
              style: TextStyle(
                color: _tabColor(index: index),
              ),
            ),
          ],
        ),
      ),
      label: 'hello',
    );
  }

  Color _tabColor({int index}) {
    return NavbarControllerState.currentTab == index
        ? ColorPrimary
        : Colors.grey;
  }

  Color _containeTopBorderColor({int index}) {
    return NavbarControllerState.currentTab == index
        ? ColorPrimary
        : Colors.transparent;
  }

  Color _containeColor({int index}) {
    return NavbarControllerState.currentTab == index
        ? ColorLightGreen.withOpacity(0.2)
        : Colors.transparent;
  }
}
