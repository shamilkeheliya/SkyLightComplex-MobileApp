import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(
          context,
          "/",
        );
        break;
      case 1:
        Navigator.pushNamed(context, "/reservation");
        break;
      case 2:
        Navigator.pushNamed(context, "/requests");
        break;
      case 3:
        Navigator.pushNamed(context, "/complains");
        break;
    }
    setState(() {
      selectedIndex = index;
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
          label: 'Reservations',
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
      currentIndex: selectedIndex,
      selectedItemColor: blueLightSelected,
      unselectedItemColor: blueLightUnelected,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(size: 35.0),
      selectedFontSize: 15.0,
      onTap: _onItemTapped,
    );
  }
}
