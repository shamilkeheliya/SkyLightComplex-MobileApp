import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import '../constant.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  get bottom => null;

  get top => null;

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
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'images/logo.png',
                      height: 140.0,
                    ),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                    child: Text(
                      'Hello There..!',
                      style: TextStyle(
                        fontSize: 40.0,
                        color: Colors.white,
                        fontFamily: mainFont,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 50.0,
                    padding:
                        EdgeInsets.symmetric(vertical: 0.0, horizontal: 80.0),
                    child: ElevatedButton(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                          fontFamily: mainFont,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
