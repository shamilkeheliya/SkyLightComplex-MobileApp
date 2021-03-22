// import 'package:fivetagsmobileapp/UI/about.dart';
// import 'package:fivetagsmobileapp/UI/contactus.dart';
// import 'package:fivetagsmobileapp/UI/profile.dart';
// import 'package:fivetagsmobileapp/UI/qna.dart';
// import 'package:fivetagsmobileapp/UI/settings.dart';
// import 'package:flutter/material.dart';
// import 'package:fivetagsmobileapp/constant.dart';
// import 'package:fivetagsmobileapp/getwidget/getwidget.dart';
//
// class Drwr extends StatefulWidget {
//   @override
//   _DrwrState createState() => _DrwrState();
// }
//
// class _DrwrState extends State<Drwr> {
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: Theme.of(context).copyWith(
//         canvasColor: blueLight,
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.only(
//           bottomRight: Radius.circular(150),
//         ),
//         child: GFDrawer(
//           child: ListView(
//             padding: EdgeInsets.zero,
//             children: <Widget>[
//               GFDrawerHeader(
//                 currentAccountPicture: GFAvatar(
//                   radius: 80.0,
//                   backgroundImage: AssetImage('images/logo.png'),
//                 ),
//                 decoration: BoxDecoration(
//                   color: blueLightUnelected,
//                   boxShadow: [BoxShadow(color: blueLight, spreadRadius: 1)],
//                 ),
//                 child: Padding(
//                   padding: EdgeInsets.only(right: 20.0),
//                   child: Center(
//                     child: Text(
//                       'Shamil\nMuhandiram',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontFamily: mainFont,
//                         fontSize: 24,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               ListTile(
//                 leading: Icon(Icons.account_circle),
//                 title: Text('Profile'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return Profile();
//                       },
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.settings),
//                 title: Text('Settings'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return Settings();
//                       },
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.contact_support),
//                 title: Text('Q n A'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return QnA();
//                       },
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.info),
//                 title: Text('About'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return About();
//                       },
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.support_agent),
//                 title: Text('Contact Us'),
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) {
//                         return ContactUs();
//                       },
//                     ),
//                   );
//                 },
//               ),
//               ListTile(
//                 //contentPadding: EdgeInsets.only(top: 100.0),
//                 leading: Icon(Icons.arrow_back),
//                 title: Text('Log Out'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
