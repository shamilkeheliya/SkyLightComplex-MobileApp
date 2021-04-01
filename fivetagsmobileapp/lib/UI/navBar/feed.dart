import 'package:fivetagsmobileapp/UI/notifications.dart';
import 'file:///H:/FiveTagsMobileApp/fivetagsmobileapp/lib/UI/drawer/qna.dart';
import 'package:fivetagsmobileapp/navBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:fivetagsmobileapp/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Feed extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Feed> {
  final _auth = FirebaseAuth.instance;
  void getCurrentUser() async {
    final user = await _auth.currentUser;
    print(user);
  }

  final _kTabPages = <Widget>[
    Center(child: Genaral()),
    Center(child: Icon(Icons.alarm, size: 64.0, color: Colors.cyan)),
  ];
  final _kTabs = <Tab>[
    const Tab(text: 'Genaral'),
    const Tab(text: 'Special'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: blueDark,
            labelColor: blueDark,
            unselectedLabelColor: blueMid,
            tabs: _kTabs,
          ),
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
        drawer: Drwr(),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [blueLight, blueDark],
              stops: [0.0, 1.0],
            ),
          ),
          child: TabBarView(
            children: _kTabPages,
          ),
        ),
        bottomNavigationBar: NavBar(),
      ),
    );
  }
}

Column Genaral() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        child: Text('shmail'),
      ),
    ],
  );
}