import 'file:///H:/FiveTagsMobileApp/fivetagsmobileapp/lib/UI/drawer/about.dart';
import 'file:///H:/FiveTagsMobileApp/fivetagsmobileapp/lib/UI/drawer/contactus.dart';
import 'file:///H:/FiveTagsMobileApp/fivetagsmobileapp/lib/UI/drawer/profile.dart';
import 'file:///H:/FiveTagsMobileApp/fivetagsmobileapp/lib/UI/drawer/qna.dart';
import 'file:///H:/FiveTagsMobileApp/fivetagsmobileapp/lib/UI/drawer/settings.dart';
import 'package:fivetagsmobileapp/UI/drawer/numbers.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_restart/flutter_restart.dart';

class Drwr extends StatefulWidget {
  String profilePhoto;
  String name;
  Drwr(profilePhoto, name) {
    this.profilePhoto = profilePhoto;
    this.name = name;
  }
  @override
  _DrwrState createState() => _DrwrState(this.profilePhoto, this.name);
}

class _DrwrState extends State<Drwr> {
  _DrwrState(profilePhoto, name) {
    this.profilePhoto = profilePhoto;
    this.name = name;
  }
  final _auth = FirebaseAuth.instance;

  String profilePhoto;
  String name;

  // @override
  // void initState() {
  //   super.initState();
  //   final User user = _auth.currentUser;
  //   final uid = user.uid;
  //
  //   FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(uid)
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     setState(() {
  //       profilePhoto = documentSnapshot.data()["profileURL"];
  //       name =
  //           '${documentSnapshot.data()["firstName"]} ${documentSnapshot.data()["lastName"]}';
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: blueLight,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(150),
        ),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: blueLightUnselected,
                  boxShadow: [BoxShadow(color: blueLight, spreadRadius: 1)],
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          foregroundImage: NetworkImage(profilePhoto),
                          backgroundImage:
                              AssetImage('images/profilePicture.jpg'),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Container(
                          child: Text(
                            name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: mainFont),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Profile();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Settingss();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.call),
                title: Text('Important Contacts'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Numbers();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.contact_support),
                title: Text('Q n A'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return QnA();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return About();
                      },
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.support_agent),
                title: Text('Contact Us'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ContactUs();
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
      ),
    );
  }
}
