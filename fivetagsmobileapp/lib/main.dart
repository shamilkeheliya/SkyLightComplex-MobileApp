import 'file:///H:/FiveTagsMobileApp/fivetagsmobileapp/lib/UI/navBar/complains.dart';
import 'file:///H:/FiveTagsMobileApp/fivetagsmobileapp/lib/UI/drawer/qna.dart';
import 'file:///H:/FiveTagsMobileApp/fivetagsmobileapp/lib/UI/navBar/requests.dart';
import 'file:///H:/FiveTagsMobileApp/fivetagsmobileapp/lib/UI/navBar/reservation.dart';
import 'package:fivetagsmobileapp/UI/drawer/contactus.dart';
import 'package:fivetagsmobileapp/navBar.dart';
import 'package:fivetagsmobileapp/test.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/UI/splash.dart';
import 'package:fivetagsmobileapp/UI/login.dart';
import 'file:///H:/FiveTagsMobileApp/fivetagsmobileapp/lib/UI/navBar/feed.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() {
//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        '/navbar': (context) => NavBar(),
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
//       home: ContactUs(),
//     );
//   }
// }
