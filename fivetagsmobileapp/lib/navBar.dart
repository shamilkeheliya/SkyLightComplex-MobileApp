import 'package:fivetagsmobileapp/UI/complains.dart';
import 'package:fivetagsmobileapp/UI/feed.dart';
import 'package:fivetagsmobileapp/UI/requests.dart';
import 'package:fivetagsmobileapp/UI/reservation.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:page_transition/page_transition.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: Feed(),
              inheritTheme: true,
              ctx: context),
        );
        break;
      case 1:
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: Reservations(),
              inheritTheme: true,
              ctx: context),
        );
        break;
      case 2:
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: Requests(),
              inheritTheme: true,
              ctx: context),
        );
        break;
      case 3:
        Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: Complains(),
              inheritTheme: true,
              ctx: context),
        );
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
