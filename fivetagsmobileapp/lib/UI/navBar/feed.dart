import 'package:firebase_auth/firebase_auth.dart';
import 'package:fivetagsmobileapp/services/eventsService.dart';
import 'package:fivetagsmobileapp/services/genaralService.dart';
import 'package:fivetagsmobileapp/services/yourReservations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Feed extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Feed> {
  final _kTabPages = <Widget>[
    //Center(child: Test()),
    Center(child: GenaralService()),
    Center(child: EventsService()),
    Center(child: YourReservationService()),
  ];

  final _kTabs = <Tab>[
    const Tab(text: 'Genaral'),
    const Tab(text: 'Events'),
    const Tab(text: 'My Reservations'),
  ];

  final keyIsFirstLoaded = 'is_first_loaded';
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showDialogIfFirstLoaded(context));

    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 50.0,
          backgroundColor: blueLight,
          bottom: TabBar(
            indicatorColor: blueDark,
            labelColor: blueDark,
            // unselectedLabelColor: blueMid,
            tabs: _kTabs,
          ),
          iconTheme: IconThemeData(
            color: blueMid,
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
          child: TabBarView(
            children: _kTabPages,
          ),
        ),
      ),
    );
  }
//}

  showDialogIfFirstLoaded(BuildContext context) async {
    String pwd;
    final _pwd = TextEditingController();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLoaded = prefs.getBool(keyIsFirstLoaded);
    if (isFirstLoaded == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            backgroundColor: blueLightSelected,
            title: new Text("Change Password"),
            content: Container(
              child: TextField(
                obscureText: true,
                controller: _pwd,
                style: TextStyle(
                  color: blueDark,
                ),
                onChanged: (value) {
                  pwd = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New Password',
                  labelStyle: TextStyle(color: blueDark),
                ),
              ),
            ),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text(
                  "Change Password",
                  style: TextStyle(color: blueDark),
                ),
                onPressed: () {
                  if (_pwd.text.isEmpty == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please enter New Password'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      ),
                    );
                  } else if (_pwd.text.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Password should have 6 characters'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      ),
                    );
                  } else {
                    final _auth = FirebaseAuth.instance;
                    final User user = _auth.currentUser;
                    user.updatePassword(pwd).then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Password Updated Successfully'),
                          action: SnackBarAction(
                            label: 'OK',
                            onPressed: () {},
                          ),
                        ),
                      );
                      Navigator.pop(context);
                      prefs.setBool(keyIsFirstLoaded, false);
                    });
                  }
                },
              ),
            ],
          );
        },
      );
    }
  }
}
