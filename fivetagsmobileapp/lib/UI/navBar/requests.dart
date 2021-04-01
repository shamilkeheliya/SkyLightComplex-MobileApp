import 'package:fivetagsmobileapp/UI/QnA/qComplains.dart';
import 'package:fivetagsmobileapp/UI/QnA/qOthers.dart';
import 'package:fivetagsmobileapp/UI/QnA/qRequests.dart';
import 'package:fivetagsmobileapp/UI/QnA/qReservation.dart';
import 'package:fivetagsmobileapp/UI/requests/electricityBillRequests.dart';
import 'package:fivetagsmobileapp/UI/requests/laborRequests.dart';
import 'package:fivetagsmobileapp/UI/requests/waterBillRequests.dart';
import 'file:///H:/FiveTagsMobileApp/fivetagsmobileapp/lib/UI/drawer/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

import '../../drawer.dart';
import '../../navBar.dart';
import '../notifications.dart';

class Requests extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blueMid,
        ),
        backgroundColor: blueLight,
        title: const Text(
          'Requests',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            btn(Icons.people_alt_outlined, 'Request Labor', LaborRequests()),
            btn(Icons.water_damage_outlined, 'Request Water Bill',
                WaterBillRequest()),
            btn(Icons.electrical_services_outlined, 'Request Electricity Bill',
                ElectricityBillRequest()),
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
  }

  Expanded btn(icon, title, page) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 15.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            gradient: LinearGradient(
              begin: Alignment(0.0, -1.0),
              end: Alignment(0.0, 1.0),
              colors: [blueLightUnelected, blueLightSelected],
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
                  child: Icon(
                    icon,
                    size: 50.0,
                  ),
                ),
                Container(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontSize: 25.0,
                        color: blueDark,
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
