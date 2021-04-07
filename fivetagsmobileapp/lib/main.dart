import 'package:fivetagsmobileapp/constant.dart';
import 'package:fivetagsmobileapp/navBar.dart';
import 'package:fivetagsmobileapp/test.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/UI/splash.dart';
import 'package:fivetagsmobileapp/UI/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

// void main() {
//   runApp(MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         buttonTheme: ButtonThemeData(
//           buttonColor: blueMid,
//         ),
//       ),
//       initialRoute: '/',
//       routes: {
//         '/': (context) => Splash(),
//         '/login': (context) => Login(),
//         '/navbar': (context) => NavBar(),
//         // '/feed': (context) => Feed(),
//         // '/reservation': (context) => Reservations(),
//         // '/requests': (context) => Requests(),
//         // '/complains': (context) => Complains(),
//       },
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}
