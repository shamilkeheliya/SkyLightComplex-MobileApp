import 'package:fivetagsmobileapp/UI/complains.dart';
import 'package:fivetagsmobileapp/UI/profile.dart';
import 'package:fivetagsmobileapp/UI/requests.dart';
import 'package:fivetagsmobileapp/UI/reservation.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/UI/splash.dart';
import 'package:fivetagsmobileapp/UI/login.dart';
import 'package:fivetagsmobileapp/UI/feed.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return Splash();
    //return Login();
    //return Feed();
    //return Reservations();
    //return Requests();
    //return Complains();
    //return Profile();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Complains(),
    );
  }
}
