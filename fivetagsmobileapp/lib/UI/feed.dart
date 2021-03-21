import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:getwidget/getwidget.dart';

class Feed extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Feed> {
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
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(150),
            ),
            child: GFDrawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const <Widget>[
                  GFDrawerHeader(
                    currentAccountPicture: GFAvatar(
                      radius: 80.0,
                      backgroundImage: AssetImage('images/logo.png'),
                    ),
                    decoration: BoxDecoration(
                      color: blueLightUnelected,
                      boxShadow: [BoxShadow(color: blueLight, spreadRadius: 1)],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Center(
                        child: Text(
                          'Shamil\nMuhandiram',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: mainFont,
                            fontSize: 24,
                          ),
                        ),
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
                    leading: Icon(Icons.contact_support),
                    title: Text('Q n A'),
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                  ),
                  ListTile(
                    leading: Icon(Icons.support_agent),
                    title: Text('Contact Us'),
                  ),
                  ListTile(
                    //contentPadding: EdgeInsets.only(top: 100.0),
                    leading: Icon(Icons.arrow_back),
                    title: Text('Log Out'),
                  ),
                ],
              ),
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
