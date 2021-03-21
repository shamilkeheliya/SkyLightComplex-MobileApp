import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

import 'constant.dart';
import 'constant.dart';
import 'constant.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              Container(
                padding: const EdgeInsets.only(top: 100.0),
                child: Image.asset(
                  'images/logo.png',
                  height: 140.0,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20.0, top: 70.0),
                child: Text(
                  'Welcom to Our',
                  style: TextStyle(
                    fontSize: 23.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 7.0,
              ),
              Center(
                child: Container(
                  child: Text(
                    'SkyLight Complex',
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 200.0),
                child: Text(
                  'User Application',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
