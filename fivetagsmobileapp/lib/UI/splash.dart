import 'package:fivetagsmobileapp/UI/login.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'dart:async';

import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.fade,
            child: Login(),
            inheritTheme: true,
            ctx: context),
      );
    });

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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //padding: const EdgeInsets.only(top: 100.0),
              child: Image.asset(
                'images/logo.png',
                height: 140.0,
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(right: 200.0),
                child: Text(
                  'Welcome to Our',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontFamily: mainFont,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Text(
                  'SkyLight',
                  style: TextStyle(
                    fontSize: 75.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                    fontFamily: mainFont,
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(left: 200.0),
                child: Text(
                  'Complex',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: mainFont,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
