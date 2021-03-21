import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.backup_table),
          label: 'Feed',
          backgroundColor: blueDark,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle),
          label: 'Bookings',
          backgroundColor: blueDark,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assistant),
          label: 'Requests',
          backgroundColor: blueDark,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.report_problem),
          label: 'Complains',
          backgroundColor: blueDark,
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: blueLightSelected,
      unselectedItemColor: blueLightUnelected,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(size: 35.0),
      selectedFontSize: 15.0,
      onTap: _onItemTapped,
    );
  }
}
