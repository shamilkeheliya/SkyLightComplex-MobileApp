import 'package:fivetagsmobileapp/UI/navBar/complains/annoyingNeighbor.dart';
import 'package:fivetagsmobileapp/UI/navBar/complains/electricalIssue.dart';
import 'package:fivetagsmobileapp/UI/navBar/complains/otherComplains.dart';
import 'package:fivetagsmobileapp/UI/navBar/complains/waterIssue.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class Complains extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Complains> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            btn('electrical', Icons.bolt, 'Electrical Issue',
                ElectricalIssue()),
            btn('water', Icons.water_damage_outlined, 'Water Issue',
                WaterIssue()),
            btn('neighbor', Icons.people, 'Annoying Neighbor', Neighbor()),
            btn('other', Icons.report, 'Other Complains', OtherComplains()),
          ],
        ),
      ),
    );
  }

  Expanded btn(heroTag, icon, title, page) {
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Hero(
                    tag: heroTag,
                    child: Icon(
                      icon,
                      color: blueDark,
                      size: 50.0,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: blueDark,
                        fontFamily: mainFont,
                        fontWeight: FontWeight.w400),
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
