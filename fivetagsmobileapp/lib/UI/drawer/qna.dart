import 'package:fivetagsmobileapp/UI/QnA/qComplains.dart';
import 'package:fivetagsmobileapp/UI/QnA/qOthers.dart';
import 'package:fivetagsmobileapp/UI/QnA/qRequests.dart';
import 'package:fivetagsmobileapp/UI/QnA/qReservation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            btn('Reservations', QReservation()),
            btn('Requests', QRequests()),
            btn('Complains', QComplains()),
            btn('Others', QOthers()),
          ],
        ),
      ),
    );
  }

  Expanded btn(title, page) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [blueLightUnselected, blueLightSelected],
              stops: [0.0, 1.0],
            ),
          ),
          child: FlatButton(
            //color: blueLightSelected,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return page;
                  },
                ),
              );
            },
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 25.0, color: blueDark, fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}
