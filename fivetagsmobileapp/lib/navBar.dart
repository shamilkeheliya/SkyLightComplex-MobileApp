import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fivetagsmobileapp/UI/navBar/complains.dart';
import 'package:fivetagsmobileapp/UI/navBar/requests.dart';
import 'package:fivetagsmobileapp/UI/navBar/reservation.dart';
import 'package:fivetagsmobileapp/UI/notifications.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:fivetagsmobileapp/drawer.dart';
import 'package:flutter/material.dart';
import 'UI/navBar/feed.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentTabIndex = 0;
  final _auth = FirebaseAuth.instance;
  String profilePhoto =
      'https://firebasestorage.googleapis.com/v0/b/mobileapp-b9de2.appspot.com/o/profilePicture.jpg?alt=media&token=fc48816b-9fac-4170-a1da-9d1f07d4f1a3';
  String name = 'Loading...';

  @override
  void initState() {
    super.initState();
    final User user = _auth.currentUser;
    final uid = user.uid;

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      setState(() {
        profilePhoto = documentSnapshot.data()["profileURL"];
        name =
            '${documentSnapshot.data()["firstName"]} ${documentSnapshot.data()["lastName"]}';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(child: Feed()),
      Center(child: Reservations()),
      Center(child: Requests()),
      Center(child: Complains()),
    ];

    final _titles = <String>[
      'SkyLight NewsFeed',
      'Reservations',
      'Requests',
      'Complains',
    ];

    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.backup_table),
        label: 'Feed',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.add_circle),
        label: 'Reservations',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.assistant),
        label: 'Requests',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.report_problem),
        label: 'Complains',
      ),
    ];

    assert(_kTabPages.length == _kBottmonNavBarItems.length);
    final bottomNavBar = BottomNavigationBar(
      items: _kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      selectedItemColor: blueLightSelected,
      unselectedItemColor: blueLightUnselected,
      backgroundColor: blueDark,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(size: 35.0),
      selectedFontSize: 15.0,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blueMid,
        ),
        backgroundColor: blueLight,
        title: Text(
          _titles[_currentTabIndex],
          style: TextStyle(
            fontFamily: mainFont,
            color: blueMid,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Notifications();
                  },
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drwr(this.profilePhoto, this.name),
      body: _kTabPages[_currentTabIndex],
      bottomNavigationBar: bottomNavBar,
    );
  }
}
