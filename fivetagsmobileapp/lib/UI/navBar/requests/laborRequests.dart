import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fivetagsmobileapp/UI/navBar/requests/laborRequestPage.dart';
import 'package:fivetagsmobileapp/UI/navBar/requests/laborRequestServices/doneLabors.dart';
import 'package:fivetagsmobileapp/UI/navBar/requests/laborRequestServices/reportedLabors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:flutter_phone_state/flutter_phone_state.dart';
import 'package:fivetagsmobileapp/UI/navBar/requests/laborRequestServices/requestedLabors.dart';
import 'package:fivetagsmobileapp/UI/navBar/requests/laborRequestServices/getLabors.dart';

class LaborRequests extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<LaborRequests> {
  final _auth = FirebaseAuth.instance;
  String name, userid, keyNum, userProfile, userMobile;
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
          'Request Labor',
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LaborRequestsPage()),
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
        FirebaseFirestore.instance.collection('laborRequests');

    return StreamBuilder<QuerySnapshot>(
      stream: genaral.where("uid", isEqualTo: user.uid).snapshots(),
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
            var type = document.data()['type'];

            if (status == 'Request') {
              return RequestedLabors(type);
            } else if (status == 'Get') {
              return GetLabors(document);
            } else if (status == 'Done') {
              return DoneLabors(document);
            } else {
              return ReportedLabors(document);
            }
          }).toList(),
        );
      },
    );
  }
}
