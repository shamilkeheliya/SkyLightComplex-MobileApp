import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:expandable/expandable.dart';
import 'package:fivetagsmobileapp/expandableCard.dart';

class QComplains extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<QComplains> {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                ExCard('How complain about Electrical issues?',
                    'First, move to the complaints Tab using the Bottom tab section. Then select the Electrical issues tab.'),
                ExCard('How complain about Water Issues?',
                    'First, move to the complaints Tab using the Bottom tab section. Then select the Water issues tab.'),
                ExCard('How complain about Annoying Neighbours?',
                    'First, move to the complaints Tab using the Bottom tab section. Then select the Annoying Neighbours tab.'),
                ExCard('How complain about Other issues?',
                    'First, move to the complaints Tab using the Bottom tab section. Then select the other issues tab. Here you can type problems you have.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
