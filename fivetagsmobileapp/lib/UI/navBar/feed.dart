import 'package:fivetagsmobileapp/services/eventsService.dart';
import 'package:fivetagsmobileapp/services/genaralService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class Feed extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Feed> {
  final _kTabPages = <Widget>[
    //Center(child: Test()),
    Center(child: GenaralService()),
    Center(child: EventsService()),
  ];

  final _kTabs = <Tab>[
    const Tab(text: 'Genaral'),
    const Tab(text: 'Events'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
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
      ),
    );
  }
}
