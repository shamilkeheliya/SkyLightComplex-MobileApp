import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class Hall extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Hall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blueMid,
        ),
        backgroundColor: blueLight,
        title: const Text(
          'Hall Reservation',
          style: TextStyle(
            fontFamily: mainFont,
            color: blueMid,
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
        child: Column(
          children: [],
        ),
      ),
    );
  }
}