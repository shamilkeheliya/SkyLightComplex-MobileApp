import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [blueLight, blueDark],
              stops: [0.0, 1.0],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: blueDark,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Bookings',
              backgroundColor: blueDark,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Requests',
              backgroundColor: blueDark,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Complains',
              backgroundColor: blueDark,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: blueLight,
          unselectedItemColor: blueLight,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
