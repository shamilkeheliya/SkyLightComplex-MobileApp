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
        appBar: AppBar(
          // leading: IconButton(
          //   icon: Icon(
          //     Icons.blur_on_rounded,
          //     color: blueDark,
          //     size: 35.0,
          //   ),
          //   onPressed: () => Scaffold.of(context).openDrawer(),
          // ),
          iconTheme: IconThemeData(
            color: blueMid,
          ),
          backgroundColor: blueLight,
          title: const Text(
            'SkyLight NewsFeed',
            style: TextStyle(
              fontFamily: mainFont,
              color: blueMid,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
        drawer: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: blueLight,
          ),
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: const <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: blueLightUnelected,
                  ),
                  child: Text(
                    'SkyLight Complex',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: mainFont,
                      fontSize: 24,
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Profile'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                ),
                ListTile(
                  leading: Icon(Icons.question_answer),
                  title: Text('Q n A'),
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('About'),
                ),
                ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Contact Us'),
                ),
                ListTile(
                  leading: Icon(Icons.arrow_back),
                  title: Text('Log Out'),
                ),
              ],
            ),
          ),
        ),
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
        ),
      ),
    );
  }
}
