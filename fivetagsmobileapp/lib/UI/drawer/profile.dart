import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class Profile extends StatefulWidget {
  String profilePhoto;
  String name;
  Profile(profilePhoto, name) {
    this.profilePhoto = profilePhoto;
    this.name = name;
  }
  @override
  _HomeState createState() => _HomeState(profilePhoto, name);
}

class _HomeState extends State<Profile> {
  String profilePhoto;
  String name;
  _HomeState(profilePhoto, name) {
    this.profilePhoto = profilePhoto;
    this.name = name;
  }
  final _auth = FirebaseAuth.instance;
  String firstName;
  String lastName;
  String mobile;
  String uid;
  String thisProfilePhoto;

  @override
  void initState() {
    super.initState();
    setState(() {
      thisProfilePhoto = profilePhoto;
    });
    final User user = _auth.currentUser;
    uid = user.uid;
    getProfile();
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      setState(() {
        firstName = documentSnapshot.data()['firstName'];
        lastName = documentSnapshot.data()['lastName'];
        mobile = documentSnapshot.data()['mobile'];
      });
    });
  }

  void getProfile() {
    final User user = _auth.currentUser;
    FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      setState(() {
        thisProfilePhoto = documentSnapshot.data()['profileURL'];
        name =
            '${documentSnapshot.data()['firstName']} ${documentSnapshot.data()['lastName']}';
      });
    });
  }

  final _fName = TextEditingController();
  final _lName = TextEditingController();
  final _mobileNum = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blueMid,
        ),
        backgroundColor: blueLight,
        title: const Text(
          'Profile',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                child: Hero(
                  tag: 'dp',
                  child: CircleAvatar(
                    foregroundImage: NetworkImage(thisProfilePhoto),
                    backgroundImage: AssetImage(profilePhoto),
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: mainFont),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              onTap: () async {},
              leading: Icon(
                Icons.account_circle_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Change Profile Picture',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: blueLightSelected,
                    title: const Text(
                      'Change First Name',
                      style: TextStyle(color: blueDark),
                    ),
                    content: Container(
                      child: TextField(
                        controller: _fName,
                        style: TextStyle(
                          color: blueDark,
                        ),
                        onChanged: (value) {
                          firstName = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: firstName,
                          labelStyle: TextStyle(color: blueDark),
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (_fName.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Name cannot be empty'),
                                action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          } else {
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(uid)
                                .update({
                              'firstName': firstName,
                            }).then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Name changed Successfully'),
                                  action: SnackBarAction(
                                    label: 'OK',
                                    onPressed: () {},
                                  ),
                                ),
                              );
                              getProfile();
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: const Text(
                          'Change',
                          style: TextStyle(color: blueDark),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Dismiss',
                          style: TextStyle(color: blueDark),
                        ),
                      ),
                    ],
                  ),
                );
              },
              leading: Icon(
                Icons.drive_file_rename_outline,
                color: Colors.white,
              ),
              title: Text(
                'Change Name',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: blueLightSelected,
                    title: const Text(
                      'Change Last Name',
                      style: TextStyle(color: blueDark),
                    ),
                    content: Container(
                      child: TextField(
                        controller: _lName,
                        style: TextStyle(
                          color: blueDark,
                        ),
                        onChanged: (value) {
                          lastName = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: lastName,
                          labelStyle: TextStyle(color: blueDark),
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (_lName.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Name cannot be empty'),
                                action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          } else {
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(uid)
                                .update({
                              'lastName': lastName,
                            }).then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Name changed Successfully'),
                                  action: SnackBarAction(
                                    label: 'OK',
                                    onPressed: () {},
                                  ),
                                ),
                              );
                              getProfile();
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: const Text(
                          'Change',
                          style: TextStyle(color: blueDark),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Dismiss',
                          style: TextStyle(color: blueDark),
                        ),
                      ),
                    ],
                  ),
                );
              },
              leading: Icon(
                Icons.drive_file_rename_outline,
                color: Colors.white,
              ),
              title: Text(
                'Change Name',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    backgroundColor: blueLightSelected,
                    title: const Text(
                      'Change Mobile Number',
                      style: TextStyle(color: blueDark),
                    ),
                    content: Container(
                      child: TextField(
                        controller: _mobileNum,
                        style: TextStyle(
                          color: blueDark,
                        ),
                        onChanged: (value) {
                          mobile = value;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: mobile,
                          labelStyle: TextStyle(color: blueDark),
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          if (_mobileNum.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Mobile Number cannot be empty'),
                                action: SnackBarAction(
                                  label: 'OK',
                                  onPressed: () {},
                                ),
                              ),
                            );
                          } else {
                            FirebaseFirestore.instance
                                .collection('users')
                                .doc(uid)
                                .update({
                              'mobile': mobile,
                            }).then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Mobile Number changed Successfully'),
                                  action: SnackBarAction(
                                    label: 'OK',
                                    onPressed: () {},
                                  ),
                                ),
                              );
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: const Text(
                          'Change',
                          style: TextStyle(color: blueDark),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'Dismiss',
                          style: TextStyle(color: blueDark),
                        ),
                      ),
                    ],
                  ),
                );
              },
              leading: Icon(
                Icons.call,
                color: Colors.white,
              ),
              title: Text(
                'Change Mobile Number',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
