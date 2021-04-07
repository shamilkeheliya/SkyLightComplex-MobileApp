import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fivetagsmobileapp/constant.dart';

class Numbers extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Numbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: blueMid,
        ),
        backgroundColor: blueLight,
        title: const Text(
          'Important Contacts',
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
        child: NumberService(),
      ),
    );
  }
}

class NumberService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference genaral =
        FirebaseFirestore.instance.collection('numbers');

    return StreamBuilder<QuerySnapshot>(
      stream: genaral.snapshots(),
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
            var name = document.data()['name'];
            var number = document.data()['number'];
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Text(
                            name,
                            style: TextStyle(
                                color: blueDark,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        Container(
                          child: Text(
                            number,
                            style: TextStyle(
                                color: blueDark,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700),
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
