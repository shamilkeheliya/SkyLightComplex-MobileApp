import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class ChangePassword extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ChangePassword> {
  final _auth = FirebaseAuth.instance;
  String email;
  String nowPassword;
  String newPassword;
  String newPasswordAgain;
  final _nowPassword = TextEditingController();
  final _newPassword = TextEditingController();
  final _newPasswordAgain = TextEditingController();

  @override
  void initState() {
    super.initState();
    final User user = _auth.currentUser;
    final uid = user.uid;

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      setState(() {
        email = documentSnapshot.data()['email'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blueMid,
        ),
        backgroundColor: blueLight,
        title: const Text(
          'Change Password',
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
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextField(
                controller: _nowPassword,
                style: TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  nowPassword = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Current Password',
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextField(
                controller: _newPassword,
                style: TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  newPassword = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New Password',
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextField(
                controller: _newPasswordAgain,
                style: TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  newPasswordAgain = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'New Password Again',
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              height: 50.0,
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 80.0),
              child: ElevatedButton(
                child: Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontFamily: mainFont,
                  ),
                ),
                onPressed: () async {
                  if (_nowPassword.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Current Password cannot be blank'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      ),
                    );
                  } else if (_newPassword.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('New Password cannot be blank'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      ),
                    );
                  } else if (_newPasswordAgain.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('New Password Again cannot be blank'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      ),
                    );
                  } else if (_newPassword.text.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('New Password should have 6 characters'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      ),
                    );
                  } else if (newPassword != newPasswordAgain) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Passwords not match'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      ),
                    );
                  } else {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: nowPassword);
                      if (user != null) {
                        final _auth = FirebaseAuth.instance;
                        final User users = _auth.currentUser;
                        users.updatePassword(newPassword).then((value) {
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
                        });
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Password not correct'),
                          action: SnackBarAction(
                            label: 'Forget Pasword',
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  backgroundColor: blueLightSelected,
                                  title: const Text(
                                    'Reset Password',
                                    style: TextStyle(color: blueDark),
                                  ),
                                  content: const Text(
                                    'Are you sure?',
                                    style: TextStyle(color: blueDark),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        final _auth = FirebaseAuth.instance;
                                        _auth
                                            .sendPasswordResetEmail(
                                                email: email)
                                            .then((value) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                  'Please check your email'),
                                              action: SnackBarAction(
                                                label: 'OK',
                                                onPressed: () {},
                                              ),
                                            ),
                                          );
                                          Navigator.pop(context);
                                        });
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
                        ),
                      );
                      print(e);
                    }
                  }
                },
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      backgroundColor: blueLightSelected,
                      title: const Text(
                        'Reset Password',
                        style: TextStyle(color: blueDark),
                      ),
                      content: const Text(
                        'Are you sure?',
                        style: TextStyle(color: blueDark),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            final _auth = FirebaseAuth.instance;
                            _auth
                                .sendPasswordResetEmail(email: email)
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Please check your email'),
                                  action: SnackBarAction(
                                    label: 'OK',
                                    onPressed: () {},
                                  ),
                                ),
                              );
                              Navigator.pop(context);
                            });
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
                child: Text('Forget Password'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
