import 'package:fivetagsmobileapp/UI/complains.dart';
import 'package:fivetagsmobileapp/UI/qna.dart';
import 'package:fivetagsmobileapp/UI/requests.dart';
import 'package:fivetagsmobileapp/UI/reservation.dart';
import 'package:fivetagsmobileapp/test.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/login': (context) => Login(),
        '/feed': (context) => Feed(),
        '/reservation': (context) => Reservations(),
        '/requests': (context) => Requests(),
        '/complains': (context) => Complains(),
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Feed(),
//     );
//   }
// }
