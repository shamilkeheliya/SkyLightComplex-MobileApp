import 'package:fivetagsmobileapp/UI/navBar/requests/laborRequests/electrician.dart';
import 'package:fivetagsmobileapp/UI/navBar/reservations/badminton.dart';
import 'package:fivetagsmobileapp/UI/navBar/reservations/billiotTable.dart';
import 'package:fivetagsmobileapp/UI/navBar/reservations/bus.dart';
import 'package:fivetagsmobileapp/UI/navBar/reservations/hall.dart';
import 'package:fivetagsmobileapp/UI/navBar/reservations/roofTop.dart';
import 'package:fivetagsmobileapp/UI/navBar/reservations/tableTennis.dart';
import 'package:fivetagsmobileapp/UI/navBar/reservations/tennisCourt.dart';
import 'package:fivetagsmobileapp/UI/navBar/reservations/van.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class Reservations extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Reservations> {
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
          children: [
            Expanded(
              child: Row(
                children: [
                  btn('hall', Icons.celebration, 'Hall', Hall()),
                  btn('roof', Icons.roofing, 'Roof Top', RoofTop()),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  btn('badminton', Icons.sports_tennis_outlined, 'Badminton',
                      Badminton()),
                  btn('tennis', Icons.sports_baseball, 'Tennis Court',
                      TennisCourt()),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  btn('billiot', Icons.sports_soccer, 'Billiot Table',
                      BilliotTable()),
                  btn('tt', Icons.sports_tennis, 'Table Tennis ',
                      TableTennis()),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  btn('van', Icons.time_to_leave, 'Van', Van()),
                  btn('bus', Icons.directions_bus, 'Bus', Bus()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded btn(heroTag, icon, title, page) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
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
                      size: 50.0,
                      color: blueDark,
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: blueDark,
                      fontWeight: FontWeight.w400,
                      fontFamily: mainFont,
                    ),
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
