import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class ElectricalIssue extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ElectricalIssue> {
  final _auth = FirebaseAuth.instance;
  String name, userid, keyNum, msg;
  final _msg = TextEditingController();
  @override
  void initState() {
    super.initState();
    final User user = _auth.currentUser;
    final uid = user.uid;
    userid = uid;

    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      setState(() {
        name =
            '${documentSnapshot.data()["firstName"]} ${documentSnapshot.data()["lastName"]}';
        keyNum = documentSnapshot.data()["keyNum"];
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
          'Complain Electrical Issue',
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
          children: [
            SizedBox(
              height: 80.0,
            ),
            Container(
              child: Hero(
                tag: 'electrical',
                child: Icon(
                  Icons.bolt,
                  size: 100.0,
                  color: blueMid,
                ),
              ),
            ),
            Center(
              child: Container(
                child: Text(
                  'Electrical Issue',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: blueMid,
                    fontFamily: mainFont,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
              child: TextField(
                controller: _msg,
                style: TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) {
                  msg = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Message',
                  labelStyle: TextStyle(color: blueLightSelected),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 80.0),
              child: ElevatedButton(
                child: Text(
                  'Complain',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: blueMid,
                    fontFamily: mainFont,
                  ),
                ),
                onPressed: () {
                  if (_msg.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Message cannot be blank'),
                        action: SnackBarAction(
                          label: 'OK',
                          onPressed: () {},
                        ),
                      ),
                    );
                  } else {
                    CollectionReference bookings =
                        FirebaseFirestore.instance.collection('complains');
                    bookings.add({
                      'uid': userid,
                      'userName': name,
                      'userKeyNum': keyNum,
                      'type': 'Electrical Issue',
                      'read': false,
                      'message': msg,
                      'addedDateTime': DateTime.now(),
                    }).then(
                      (value) {
                        print("Complain Added");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Complain added Successfully'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {},
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    ).catchError((error) => print("Failed: $error"));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
