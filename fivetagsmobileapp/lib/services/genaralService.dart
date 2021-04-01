import 'package:fivetagsmobileapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GenaralService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference genaral =
        FirebaseFirestore.instance.collection('bookings');

    return StreamBuilder<QuerySnapshot>(
      stream: genaral.where("accept", isEqualTo: true).snapshots(),
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
            var userName = document.data()['userName'];
            return new Card(
              color: cardBack,
              elevation: 8.0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30.0,
                      foregroundImage:
                          NetworkImage(document.data()['userProfile']),
                      backgroundImage: AssetImage('images/profilePicture.jpg'),
                    ),
                    title: Text(
                      '$type Reservation',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    subtitle: Text(
                      '$date at $time',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '$userName reserved $type on $date at $time',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
