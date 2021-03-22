import 'package:fivetagsmobileapp/UI/notifications.dart';
import 'package:fivetagsmobileapp/navBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:fivetagsmobileapp/drawer.dart';
//import 'package:fivetagsmobileapp/flutter/packages/flutter/lib/src/material/app_bar.dart';

class Feed extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blueMid,
        ),
        backgroundColor: blueLight,
        leading: IconButton(
          icon: Icon(Icons.accessible),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
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
      ),
      bottomNavigationBar: NavBar(),
    );
  }
}
