import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class Numbers extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Numbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blueMid,
        ),
        backgroundColor: blueLight,
        title: const Text(
          'Important Contacts',
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
      ),
    );
  }
}