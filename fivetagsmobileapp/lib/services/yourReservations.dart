import 'package:firebase_auth/firebase_auth.dart';
import 'package:fivetagsmobileapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class YourReservationService extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference genaral =
        FirebaseFirestore.instance.collection('bookings');

    final User user = _auth.currentUser;

    return StreamBuilder<QuerySnapshot>(
      stream: genaral.where("uid", isEqualTo: user.uid).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text(
            'Something went wrong',
            style: TextStyle(
              color: blueMid,
              fontSize: 20.0,
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
            "Loading...",
            style: TextStyle(
              color: blueMid,
              fontSize: 20.0,
            ),
          );
        }

        return new ListView(
          children: snapshot.data.docs.map((DocumentSnapshot document) {
            var type = document.data()['type'];
            var date = document.data()['date'];
            var time = document.data()['time'];
            var read = document.data()['read'];
            var accept = document.data()['accept'];
            var status;
            Color statusColor;

            if (read == false) {
              status = 'Pending';
              statusColor = Colors.yellow[800];
            } else {
              if (accept == true) {
                status = 'Accepted';
                statusColor = Colors.lightGreen[900];
              } else {
                status = 'Declined';
                statusColor = Colors.redAccent[700];
              }
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
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                          foregroundImage:
                              NetworkImage(document.data()['userProfile']),
                          backgroundImage:
                              AssetImage('images/profilePicture.jpg'),
                        ),
                        title: Text(
                          '$type Reservation',
                          style: TextStyle(color: blueDark, fontSize: 20.0),
                        ),
                        subtitle: Text(
                          '$date at $time',
                          style: TextStyle(color: blueDark),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          status,
                          style: TextStyle(
                              color: statusColor,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ],
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
