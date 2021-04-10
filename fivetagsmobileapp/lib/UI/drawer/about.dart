import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class About extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blueMid,
        ),
        backgroundColor: blueLight,
        title: const Text(
          'About',
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
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  'The topic we have chosen to create a mobile application for mobile phones to people live in house complex.\n\nThere we planned to create some special features about related to the house complex.\n\nThe main purpose of creating this mobile app is save the house owners time, easy to make their day-to-day life and give some idea about what the events are happening in his house complex and other side we think it was very helpful for management to provide their service in the house complex.Then user can download this app through scanning QR code, and they can log using their email and given password.\n\n\n\n CopyRight @ FiveTags',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
