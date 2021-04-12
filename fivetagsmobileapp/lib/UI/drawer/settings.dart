import 'package:firebase_auth/firebase_auth.dart';
import 'package:fivetagsmobileapp/UI/drawer/profile.dart';
import 'package:fivetagsmobileapp/UI/drawer/settings/changeEmail.dart';
import 'package:fivetagsmobileapp/UI/drawer/settings/changePassword.dart';
import 'package:fivetagsmobileapp/UI/drawer/settings/notificationSettings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:flutter_restart/flutter_restart.dart';

class Settingss extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Settingss> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blueMid,
        ),
        backgroundColor: blueLight,
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: mainFont,
            color: blueMid,
          ),
        ),
      ),
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
          padding: EdgeInsets.zero,
          children: [
            // ListTile(
            //   leading: Icon(Icons.account_circle),
            //   title: Text('Edit Profile'),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) {
            //           return Profile();
            //         },
            //       ),
            //     );
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Change Email'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChangeEmail();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text('Change Password'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChangePassword();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NotificationSettings();
                    },
                  ),
                );
              },
            ),
            ListTile(
              //contentPadding: EdgeInsets.only(top: 100.0),
              leading: Icon(Icons.arrow_back),
              title: Text('Log Out'),
              onTap: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: blueLightSelected,
                    title: const Text(
                      'Log Out',
                      style: TextStyle(color: blueDark),
                    ),
                    content: const Text(
                      'Are you sure?',
                      style: TextStyle(color: blueDark),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                          FlutterRestart.restartApp();
                        },
                        child: const Text(
                          'Yes',
                          style: TextStyle(color: blueDark),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'No',
                          style: TextStyle(color: blueDark),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
