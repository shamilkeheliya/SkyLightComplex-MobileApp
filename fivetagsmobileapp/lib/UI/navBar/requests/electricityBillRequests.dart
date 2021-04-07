import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class ElectricityBillRequest extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ElectricityBillRequest> {
  final _auth = FirebaseAuth.instance;
  String name, userid, keyNum;
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
          'Request Electricity Bill',
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
        child: RequestsService(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueLight,
        child: const Icon(
          Icons.add,
          color: blueDark,
          size: 35.0,
        ),
        onPressed: () async {
          showDialog(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              backgroundColor: blueLightSelected,
              title: const Text(
                'Request Electricity Bill',
                style: TextStyle(color: blueDark),
              ),
              content: const Text(
                'Are you sure?',
                style: TextStyle(color: blueDark),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    CollectionReference bookings =
                        FirebaseFirestore.instance.collection('requests');
                    bookings.add({
                      'uid': userid,
                      'userName': name,
                      'userKeyNum': keyNum,
                      'type': 'Electricity Bill Amount',
                      'status': 'request',
                      'addedDateTime': DateTime.now(),
                    }).then(
                      (value) {
                        print("Request Added");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Request added Successfully'),
                            action: SnackBarAction(
                              label: 'OK',
                              onPressed: () {},
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      },
                    ).catchError((error) => print("Failed: $error"));
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
    );
  }
}

class RequestsService extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final User user = _auth.currentUser;
    CollectionReference genaral =
        FirebaseFirestore.instance.collection('requests');

    return StreamBuilder<QuerySnapshot>(
      stream: genaral
          .where("uid", isEqualTo: user.uid)
          .where("type", isEqualTo: 'Electricity Bill Amount')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
          return Center(
            child: Text(
              'Something went wrong',
              style: TextStyle(
                color: blueMid,
                fontSize: 20.0,
              ),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text(
              "Loading...",
              style: TextStyle(
                color: blueMid,
                fontSize: 20.0,
              ),
            ),
          );
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            var status = document.data()['status'];
            var amount = document.data()['reply'];
            var textStatus;
            Color statusColor;

            if (status == 'request') {
              textStatus = 'Pending';
              statusColor = Colors.yellow[800];
            } else if (status == 'read') {
              textStatus = 'In Progress';
              statusColor = Colors.lightGreen[900];
            } else {
              textStatus = amount;
              statusColor = Colors.redAccent[700];
            }

            return Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 1.0, 4.0, 1.0),
              child: new Card(
                elevation: 8.0,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.0, -1.0),
                      end: Alignment(0.0, 1.0),
                      colors: [blueLightUnselected, blueLightSelected],
                      stops: [0.0, 1.0],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 5.0),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            'You requested electricity bill amount',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: blueDark,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          child: Text(
                            textStatus,
                            style: TextStyle(
                                fontSize: 18.0,
                                color: statusColor,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
