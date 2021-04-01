import 'package:fivetagsmobileapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventsService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference events =
        FirebaseFirestore.instance.collection("events");

    return StreamBuilder<QuerySnapshot>(
      stream: events.orderBy('date').snapshots(),
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
            var date = document.data()['date'];
            var time = document.data()['time'];
            return new Card(
              color: cardBack,
              elevation: 8.0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      document.data()['title'],
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                    subtitle: Text(
                      '$date at $time',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Image.network(document.data()['imageURL']),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        document.data()['description'],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
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
