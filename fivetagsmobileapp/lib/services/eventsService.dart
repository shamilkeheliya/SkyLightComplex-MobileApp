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
            var date = document.data()['date'];
            var time = document.data()['time'];
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
                        title: Text(
                          document.data()['title'],
                          style: TextStyle(color: blueDark, fontSize: 20.0),
                        ),
                        subtitle: Text(
                          '$date at $time',
                          style: TextStyle(color: blueDark),
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
                              color: blueDark,
                            ),
                          ),
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
