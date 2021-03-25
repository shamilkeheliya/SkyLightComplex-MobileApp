import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:expandable/expandable.dart';
import 'package:fivetagsmobileapp/expandableCard.dart';

class QnA extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<QnA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blueMid,
        ),
        backgroundColor: blueLight,
        title: const Text(
          'Q n A',
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
        child: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: blueMid,
            useInkWell: true,
          ),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              ExCard('How Book Hall?',
                  'First, move to the Booking Tab using the bottom tab section. Then select Hall. Then pick a date and time for the booking. Last, Click on the “Reserve” button.'),
              ExCard('How Book Rooftop?',
                  'First, move to the Booking Tab using the bottom tab section. Then select the Rooftop. Then pick a date and time for the booking. Last, Click on the “Reserve” button.'),
              ExCard('How Book Table Tennis Table?',
                  ' First, move to the Booking Tab using the bottom tab section. Then select Table Tennis Table. Then pick a date and time for the booking. Last, Click on the “Reserve” button.'),
              ExCard('How Book Badminton Court?',
                  ' First, move to the Booking Tab using the bottom tab section. Then select Table Tennis Table. Then pick a date and time for the booking. Last, Click on the “Reserve” button.'),
              ExCard('How Book Billiard Table?',
                  'First, move to the Booking Tab using the bottom tab section. Then select the Billiard Table. Then pick a date and time for the booking. Last, Click on the “Reserve” button.'),
              ExCard('How Book Tennis Court?',
                  'First, move to the Booking Tab using the bottom tab section. Then select the Tennis Court. Then pick a date and time for the booking. Last, Click on the “Reserve” button.'),
              ExCard('How Book Vehicle?',
                  'First, move to the Booking Tab using the bottom tab section. Then select the Vehicle you want. Then pick a date and time for the booking. Last, Click on the “Reserve” button.'),
              ExCard('Question', 'Description'),
            ],
          ),
        ),
      ),
    );
  }
}
